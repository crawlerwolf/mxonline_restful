import base64
from datetime import datetime

from django.contrib.auth.hashers import make_password

# Create your views here.
from django.contrib.auth import login, logout
from django.db.models import Q

from rest_framework import mixins, viewsets, generics, authentication, permissions, status
from rest_framework.response import Response
from captcha.views import CaptchaStore, captcha_image
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework_jwt.settings import api_settings
from settings import RESR_JWT, RESR_JWT_EXPIRATION_DELTA, AUTH_COOKIE, IS_TOKEN

from users.authentication import UserAuthentication, UserJWTAuthentication
from utils.email_send import send_email
from .models import UserProfile, EmailVerifyRecord
from .serializer import UserInfoSerializer, UserRegSerializer, UserLoginSerializer
from .serializer import UserChangePwdSerializer, UserInfoUpdateSerializer, UserForgetPwdSerializer
from .serializer import EmailSendSerializer, UserActiveSerializer, UserEmailChangeSerializer

jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER


def get_token(user, response=None):
    """
    添加token
    :param user: 用户query
    :param response: 返回的response
    :return:
    """
    if IS_TOKEN:
        if RESR_JWT:
            # 登录成功，签发token,通过当前登录用户获取荷载（payload）
            payload = jwt_payload_handler(user)
            # 通过payload生成token串（三段：头，payload，签名）
            token = jwt_encode_handler(payload)
        else:
            # 登录成功，签发token,通过当前登录用户获取token
            tokens, created = Token.objects.get_or_create(user=user)
            token = tokens.key
        response_data = {"msg": "登录成功", 'token': token}
        if response:
            response = response
        else:
            response = Response(response_data)
        expiration = (datetime.utcnow() +
                      RESR_JWT_EXPIRATION_DELTA)
        response.set_cookie(AUTH_COOKIE,
                            token,
                            expires=expiration,
                            httponly=True)
        return response


def remove_token(user, data=None):
    """
    删除token
    :param user: 用户query
    :param data: 要返回的信息dict
    :return:
    """
    if IS_TOKEN:
        if RESR_JWT:
            pass
        else:
            token = Token.objects.get(user=user)
            token.delete()
        if not data:
            data = {"msg": "用户已退出"}
        response = Response(data)
        response.set_cookie(AUTH_COOKIE,
                            "",
                            expires=datetime.utcnow(),
                            httponly=True)
        return response


def remove_email_code(code, send_type):
    """
    查询邮箱验证码记录
    :param code: 邮箱验证码
    :param send_type: 验证码类型
    :return:
    """
    all_records = EmailVerifyRecord.objects.filter(Q(code=code) &
                                                   Q(send_type=send_type))
    if all_records:
        for record in all_records:
            # 删除记录
            record.delete()


class UserLoginViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    用户获取token
    """
    serializer_class = UserLoginSerializer

    def create(self, request, *args, **kwargs):
        """
        生成并返回token，并将token加到cookie中
        """
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        if not user.is_active:
            return Response({"msg": "用户未激活"})
        token = get_token(user)
        if token:
            return token
        login(request, user, backend='users.backends.UserModelBackend')
        data = {"msg": "登录成功"}
        return Response(data)


class UserLogoutView(APIView):
    """
    用户登出
    """
    permission_classes = [permissions.IsAuthenticated]
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)

    def get(self, request):
        user = request.user
        remove = remove_token(user)
        if remove:
            return remove
        logout(request)
        data = {"msg": "用户已退出"}
        return Response(data)


class UserProfileViewSet(mixins.UpdateModelMixin, mixins.CreateModelMixin,
                         mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    用户信息
        create：
            创建用户
        partial_update：
            更新用户密码
        update：
            用户修改个人信息
        retrieve：
            获取用户信息
    """
    queryset = UserProfile.objects.all()
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)

    def get_permissions(self):
        if self.action == "create":
            return []
        return [permissions.IsAuthenticated()]

    def updata_pwd(self, user, data):
        """
        更新用户密码信息
        :param user: 当前用户
        :param data: 获取验证后的数据
        :return:
        """
        if self.action == "partial_update":
            pwd1 = data.get("password1")
            pwd2 = data.get("password2")
            if pwd1 == pwd2:
                user = UserProfile.objects.get(id=user.id)
                user.password = make_password(pwd2)
                user.save()
                return Response({"msg": "密码已修改"}, status=status.HTTP_202_ACCEPTED)

    def is_auth(self, request, instance):
        """
        是否有修改权限
        :param request:
        :param instance:
        :return:
        """
        if request.user == instance:
            return
        if request.user.is_superuser:
            return
        return Response({"msg": "无权限"}, status=status.HTTP_403_FORBIDDEN)

    def re_login(self, request, instance, serializer):
        """
        更新密码后重新登录
        :param request: 请求--获取用户实例
        :param instance: 获取的实例--用户
        :param serializer: 验证后的serializer--获取验证后的数据
        :return:
        """
        msg = self.updata_pwd(instance, serializer.validated_data)
        if request.user == instance or not request.user.is_superuser:
            if IS_TOKEN:
                msg = remove_token(request.user, data={"msg": "密码已修改"})
            else:
                from django.contrib.auth.models import AnonymousUser
                request.user = AnonymousUser()
        return msg

    def get_serializer_class(self):
        if self.action == "create":
            return UserRegSerializer
        elif self.action == "partial_update":
            return UserChangePwdSerializer
        elif self.action == "update":
            return UserInfoUpdateSerializer
        return UserInfoSerializer

    def perform_create(self, serializer):
        # 将新注册用户设置为未激活状态
        serializer.validated_data["is_active"] = False
        serializer.save()

    # def get_object(self):
    #     obj = self.request.user
    #     self.check_object_permissions(self.request, obj)
    #     return obj

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        auth = self.is_auth(request, instance)
        if isinstance(auth, Response):
            return auth
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        msg = self.re_login(request, instance, serializer)
        if msg:
            return msg
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)


class UserEmailChangeViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    修改邮箱
    """
    serializer_class = UserEmailChangeSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = UserProfile.objects.get(id=request.user.id)
        user.email = serializer.validated_data["email2"]
        user.save()
        remove_email_code(serializer.validated_data["code"], "updata_email")
        return Response({'msg': '邮箱已修改'}, status=status.HTTP_200_OK)


class UserForgetPwdViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    用户忘记密码
    """
    serializer_class = UserForgetPwdSerializer

    def updata_pwd(self, data):
        """
        用户重置密码
        """
        pwd1 = data.get("password1")
        pwd2 = data.get("password2")
        if pwd1 == pwd2:
            user = UserProfile.objects.get(email=data.get("email"))
            user.password = make_password(pwd2)
            user.save()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.updata_pwd(serializer.validated_data)
        remove_email_code(serializer.validated_data["code"], "forget")
        return Response({'msg': '密码已重置'}, status=status.HTTP_200_OK)


class EmailSendViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    发送邮箱验证
    """
    serializer_class = EmailSendSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        send_email(serializer.validated_data["email"], serializer.validated_data["send_type"])
        return Response({'msg': '邮箱验证码已发送'}, status=status.HTTP_200_OK)


class UserActiveViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    使用邮箱激活用户
    """
    serializer_class = UserActiveSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = UserProfile.objects.get(email=serializer.validated_data["email"])
        user.is_active = True
        user.save()
        remove_email_code(serializer.validated_data["code"], "register")
        return Response({"msg": "用户激活成功"}, status=status.HTTP_200_OK)


class CaptchaView(APIView):
    """
        获取验证码
    """
    def get(self, request):
        """
        生成验证码图片类型为png, 返回信息为base64编码后的图片和图片的hashkey，
        """
        hash_key = CaptchaStore.generate_key()
        # 获取图片
        image = captcha_image(request, hash_key)
        image_base = base64.b64encode(image.content)
        json_data = {"id": hash_key, "image_base": image_base.decode('utf8')}
        return Response(json_data)
