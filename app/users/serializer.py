# -*- coding: utf-8 -*-
import re
from datetime import datetime

from django.contrib.auth.hashers import make_password
from django.db.models import Q
from rest_framework import serializers
from captcha.views import CaptchaStore
from rest_framework.validators import UniqueValidator

from .models import UserProfile, EmailVerifyRecord
from .backends import UserModelBackend


def mobile_reg(value):
    """检查是否为空"""
    if not value:
        return value

    """检查是否为纯数字"""
    try:
        int(value)
    except ValueError:
        raise serializers.ValidationError("手机号只能是数字")

    """验证手机号"""
    pattern = "^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$"
    date = re.match(pattern, value)
    if not date:
        raise serializers.ValidationError("请输入正确的手机号")
    return value


class UserLoginSerializer(serializers.ModelSerializer):
    """用户"""
    username = serializers.CharField(write_only=True, required=True, allow_null=False, help_text="用户", label="用户")
    password = serializers.CharField(write_only=True, required=True, help_text="密码", label="密码", max_length=16,
                                     min_length=6, allow_null=False, error_messages={
                                         'max_length': '密码长度不大于16位',
                                         'min_length': '密码长度不小于6位',
                                         'allow_null': '密码不能为空',
                                     },
                                     style={'input_type': 'password'})

    def validate_username(self, username):
        """查看用户是否存在"""
        user = UserModelBackend().authenticate(username)
        if user:
            return username
        else:
            raise serializers.ValidationError("用户不存在")

    def validate_password(self, password):
        """查看密码是否正确"""
        user = UserModelBackend().authenticate(self.initial_data['username'], password)
        if user:
                return password
        else:
            raise serializers.ValidationError("密码错误")

    def validate(self, attrs):
        user = UserProfile.objects.filter(Q(username=attrs["username"])
                                          | Q(email=attrs["username"]) | Q(mobile=attrs["username"])).first()
        attrs['user'] = user
        return attrs

    class Meta:
        model = UserProfile
        fields = ['username', 'password']


class UserInfoSerializer(serializers.ModelSerializer):
    """用户详情信息列化类"""

    class Meta:
        model = UserProfile
        fields = ['id', 'nick_name', 'birday', 'gender', 'address', 'mobile', 'image', 'email']


class UserRegSerializer(serializers.ModelSerializer):
    """用户注册信息列化类"""
    username = serializers.CharField(required=True, allow_null=False, help_text="用户名", label="用户名",
                                     validators=[UniqueValidator(
                                         queryset=UserProfile.objects.all(), message='用户名已被使用')])
    email = serializers.EmailField(required=True, help_text="邮箱", label="邮箱",
                                     allow_null=False, error_messages={
                                         'required': '请输入邮箱'
                                     })
    mobile = serializers.CharField(required=False, allow_null=True, help_text="手机号", label="手机号",
                                   validators=[mobile_reg], max_length=11, min_length=11,
                                   error_messages={
                                         'max_length': '手机号长度不是11位',
                                         'min_length': '手机号长度不是11位'
                                     })
    password = serializers.CharField(write_only=True, required=True, help_text="密码", label="密码", max_length=16,
                                     min_length=6, allow_null=False, error_messages={
                                         'max_length': '密码长度不大于16位',
                                         'min_length': '密码长度不小于6位',
                                         'allow_null': '密码不能为空',
                                     },
                                     style={'input_type': 'password'})

    captcha = serializers.CharField(required=True, write_only=True, max_length=4, min_length=4, help_text="验证码",
                                    label="验证码", error_messages={
                                        "max_length": "验证码错误",
                                        "min_length": "验证码错误",
                                        "required": "请输入验证码"})
    hashkey = serializers.CharField(required=True, write_only=True, allow_blank=False,
                                    help_text="验证码的hashkey", label="验证码的hashkey")

    def validate_password(self, password):
        """设置密码"""
        password = make_password(password)
        return password

    def validate_email(self, email):
        """查看邮箱是否被使用"""
        user = UserProfile.objects.filter(email=email)
        if user:
            raise serializers.ValidationError("邮箱已被使用")
        return email

    def validate_captcha(self, captcha):
        """
        验证图片验证码
        :param captcha:
        :return:
        """
        # 查询验证码是否存在
        try:
            image_instance = CaptchaStore.objects.get(hashkey=self.initial_data['hashkey'])
        except CaptchaStore.DoesNotExist:
            raise serializers.ValidationError("验证码不存在")

        # 查询验证码是否过期
        if datetime.now() > image_instance.expiration:
            raise serializers.ValidationError('验证码过期')

        # 查询验证码是否正确
        if image_instance.response == captcha.lower():
            # 将验证码过期
            image_instance.expiration = datetime.now()
            image_instance.save()
            return captcha
        else:
            raise serializers.ValidationError("验证码错误")

    def validate(self, attrs):
        # 昵称不填写默认为用户名
        nick_name = attrs.get('nick_name')
        if not nick_name:
            attrs['nick_name'] = attrs['username']

        del attrs["hashkey"]
        del attrs["captcha"]
        return attrs

    class Meta:
        model = UserProfile
        fields = ['username', 'nick_name', 'birday', 'gender', 'address', 'mobile',
                  'email', 'password', 'hashkey', 'captcha']


class UserInfoUpdateSerializer(serializers.ModelSerializer):
    """用户更新个人"""
    nick_name = serializers.CharField(required=False, help_text="昵称", label="昵称")
    image = serializers.ImageField(required=False, help_text="头像", label="头像")
    address = serializers.CharField(required=False, help_text="地址", label="地址")
    email = serializers.EmailField(required=False, read_only=True, help_text="邮箱", label="邮箱")
    mobile = serializers.CharField(required=False, read_only=True, help_text="手机号", label="手机号",
                                   max_length=11, min_length=11,
                                   error_messages={
                                       'max_length': '手机号长度不是11位',
                                       'min_length': '手机号长度不是11位'
                                   })

    def validate_mobile(self, mobile):
        mobile_reg(mobile)
        """查看手机号是否被使用"""
        user = UserProfile.objects.filter(mobile=mobile)
        if user:
            raise serializers.ValidationError("手机号已被使用")
        return mobile

    class Meta:
        model = UserProfile
        fields = ['nick_name', 'birday', 'gender', 'address', 'mobile', 'image', 'email']


class UserChangePwdSerializer(serializers.Serializer):
    """用户修改密码"""
    password1 = serializers.CharField(required=True, write_only=True, help_text="新密码", label="新密码",
                                     max_length=16, min_length=6, style={'input_type': 'password'},
                                     allow_null=False, error_messages={
                                         'max_length': '密码长度不大于16位',
                                         'min_length': '密码长度不小于6位',
                                         'allow_null': '密码不能为空',
                                     })

    password2 = serializers.CharField(required=True, write_only=True, help_text="确认密码", label="确认密码",
                                     max_length=16, min_length=6, style={'input_type': 'password'},
                                     allow_null=False, error_messages={
                                         'max_length': '密码长度不大于16位',
                                         'min_length': '密码长度不小于6位',
                                         'allow_null': '密码不能为空',
                                     })


class UserForgetPwdSerializer(serializers.Serializer):
    """用户忘记密码"""
    email = serializers.EmailField(write_only=True, required=True, help_text="邮箱", label="邮箱",
                                     allow_null=False, error_messages={
                                         'invalid': '邮箱'
                                     })
    password1 = serializers.CharField(required=True, write_only=True, help_text="新密码", label="新密码",
                                     max_length=16, min_length=6, style={'input_type': 'password'},
                                     allow_null=False, error_messages={
                                         'max_length': '密码长度不大于16位',
                                         'min_length': '密码长度不小于6位',
                                         'allow_null': '密码不能为空',
                                     })

    password2 = serializers.CharField(required=True, write_only=True, help_text="确认密码", label="确认密码",
                                     max_length=16, min_length=6, style={'input_type': 'password'},
                                     allow_null=False, error_messages={
                                         'max_length': '密码长度不大于16位',
                                         'min_length': '密码长度不小于6位',
                                         'allow_null': '密码不能为空',
                                     })
    code = serializers.CharField(write_only=True, required=True, label="邮箱验证码",
                                      help_text="邮箱验证码", max_length=20, min_length=6,
                                      allow_null=False, error_messages={
                                            'invalid': '请输入验证码',
                                            'max_length': '验证码错误',
                                            'min_length': '验证码错误'})

    def validate_code(self, code):
        """查看验证码是否存在"""
        code_is_exit = EmailVerifyRecord.objects.filter(Q(code=code) & Q(send_type="forget"))
        if code_is_exit:
            return code
        else:
            raise serializers.ValidationError("验证码已过期或不存在")


class UserEmailChangeSerializer(serializers.Serializer):
    """
    用户修改邮箱
    """
    email1 = serializers.EmailField(write_only=True, required=True, help_text="原始邮箱", label="原始邮箱",
                                     allow_null=False, error_messages={
                                         'invalid': '原始邮箱'
                                     })
    email2 = serializers.EmailField(write_only=True, required=True, help_text="邮箱", label="邮箱",
                                     allow_null=False, error_messages={
                                         'invalid': '邮箱'
                                     })
    code = serializers.CharField(write_only=True, required=True, label="邮箱验证码",
                                      help_text="邮箱验证码", max_length=20, min_length=6,
                                      allow_null=False, error_messages={
                                            'invalid': '请输入验证码',
                                            'max_length': '验证码错误',
                                            'min_length': '验证码错误'})

    def validate_code(self, code):
        """查看验证码是否存在"""
        code_is_exit = EmailVerifyRecord.objects.filter(Q(code=code) & Q(send_type="updata_email"))
        if code_is_exit:
            return code
        else:
            raise serializers.ValidationError("验证码已过期或不存在")


class EmailSendSerializer(serializers.ModelSerializer):
    """
    验证邮箱并发送邮箱验证码code
    """
    email = serializers.EmailField(write_only=True, required=True, help_text="邮箱", label="邮箱",
                                     allow_null=False, error_messages={
                                         'invalid': '邮箱格式错误'
                                     })
    send_type = serializers.CharField(write_only=True, required=True, label="类型",
                                      help_text="类型(register:注册,forget:找回密码,updata_email:修改邮箱)",
                                      allow_null=False, error_messages={
                                         'invalid': '类型错误'
                                     })

    def validate_send_type(self, send_type):
        """查看类型是否正确"""
        if send_type in ['register', 'forget', 'updata_email']:
            return send_type
        else:
            raise serializers.ValidationError("类型错误")

    def validate_email(self, email):
        """查看邮箱是否有用户使用"""
        try:
            user = UserProfile.objects.get(email=email)
        except UserProfile.DoesNotExist:
            # 如果类型不是修改邮箱则报错
            if self.initial_data["send_type"] == "updata_email":
                return email
            raise serializers.ValidationError("该邮箱不在平台，检查邮箱是否正确")
        # 用户使用
        if user:
            # 如果类型是修改邮箱则报错
            if self.initial_data["send_type"] == "updata_email":
                raise serializers.ValidationError("该邮箱已被使用")
        return email

    class Meta:
        model = EmailVerifyRecord
        fields = ['email', 'send_type']


class UserActiveSerializer(serializers.Serializer):
    """
    邮箱激活用户
    """
    email = serializers.EmailField(write_only=True, required=True, help_text="邮箱", label="邮箱",
                                     allow_null=False, error_messages={
                                         'invalid': '请输入邮箱'
                                     })
    code = serializers.CharField(write_only=True, required=True, label="邮箱验证码",
                                      help_text="邮箱验证码", max_length=20, min_length=6,
                                      allow_null=False, error_messages={
                                            'invalid': '请输入验证码',
                                            'max_length': '验证码错误',
                                            'min_length': '验证码错误'})

    def validate_code(self, code):
        """查看验证码是否存在"""
        code_is_exit = EmailVerifyRecord.objects.filter(Q(code=code) & Q(send_type="register"))
        if code_is_exit:
            return code
        else:
            raise serializers.ValidationError("验证码已过期或不存在")

