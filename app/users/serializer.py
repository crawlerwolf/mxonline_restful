# -*- coding: utf-8 -*-
import re
from datetime import datetime

from django.contrib.auth.hashers import make_password, check_password
from django.db.models import Q
from rest_framework import serializers
from captcha.views import CaptchaStore
from rest_framework.validators import UniqueValidator

from .models import UserProfile


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
        user = UserProfile.objects.filter(Q(username=username) | Q(email=username) | Q(mobile=username))
        if user:
            return username
        else:
            raise serializers.ValidationError("用户不存在")

    def validate_password(self, password):
        """查看密码是否正确"""
        user = UserProfile.objects.filter(
            Q(username=self.initial_data['username']) | Q(email=self.initial_data['username'])
            | Q(mobile=self.initial_data['username']))
        if user:
            encoded = user.first().password
            if check_password(password, encoded):
                return password
            raise serializers.ValidationError("密码错误")
        return password

    def validate(self, attrs):
        user = UserProfile.objects.filter(Q(username=attrs["username"])
                                          | Q(email=attrs["username"]) | Q(mobile=attrs["username"])).first()
        attrs['user'] = user
        return attrs

    class Meta:
        model = UserProfile
        fields = ['username', 'password']


class UserLogOutSerializer(serializers.Serializer):
    """用户登出"""
    msg = serializers.CharField()


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
    mobile = serializers.CharField(required=False, help_text="手机号", label="手机号",
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


class UserPwdSerializer(serializers.Serializer):
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


class UserActiveSerializer(serializers.Serializer):

    email = serializers.EmailField(help_text="邮箱", label="邮箱",
                                     max_length=16, min_length=6,
                                     allow_null=False, error_messages={
                                         'invalid': '邮箱格式错误'
                                     })
