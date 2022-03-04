import base64
from datetime import datetime

from django.contrib.auth.hashers import make_password

# Create your views here.

from rest_framework import mixins, viewsets, generics, authentication, permissions, status
from rest_framework.response import Response
from captcha.views import CaptchaStore, captcha_image
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework_jwt.settings import api_settings
from settings import RESR_JWT, RESR_JWT_EXPIRATION_DELTA, AUTH_COOKIE, IS_TOKEN

from users.authentication import UserAuthentication, UserJWTAuthentication
from .models import UserProfile
from .serializer import UserInfoSerializer, UserRegSerializer, UserLoginSerializer, UserLogOutSerializer
from .serializer import UserPwdSerializer, UserInfoUpdateSerializer

jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER


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
        if RESR_JWT:
            # 登录成功，签发token,通过当前登录用户获取荷载（payload）
            payload = jwt_payload_handler(user)
            # 通过payload生成token串（三段：头，payload，签名）
            token = jwt_encode_handler(payload)
        else:
            # 登录成功，签发token,通过当前登录用户获取token
            tokens, created = Token.objects.get_or_create(user=user)
            token = tokens.key
        response_data = {'token': token}
        response = Response(response_data)
        expiration = (datetime.utcnow() +
                      RESR_JWT_EXPIRATION_DELTA)
        response.set_cookie(AUTH_COOKIE,
                            token,
                            expires=expiration,
                            httponly=True)
        return response


class UserLogoutView(APIView):
    """
    用户登出
    """
    serializer_class = UserLogOutSerializer
    permission_classes = [permissions.IsAuthenticated]
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)

    def get(self, request):
        user = request.user
        if IS_TOKEN:
            if RESR_JWT:
                pass
            else:
                token = Token.objects.get(user=user)
                token.delete()
            data = {"msg": "用户已退出"}
            response = Response(data)
            response.set_cookie(AUTH_COOKIE,
                                "",
                                expires=datetime.utcnow(),
                                httponly=True)
            return response
        data = {}
        return Response(data, headers=data)


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

    def get_serializer_class(self):
        if self.action == "create":
            return UserRegSerializer
        elif self.action == "partial_update":
            return UserPwdSerializer
        elif self.action == "update":
            return UserInfoUpdateSerializer
        return UserInfoSerializer

    def perform_create(self, serializer):
        # 将新注册用户设置为未激活状态
        serializer.validated_data["is_active"] = False
        serializer.save()

    def get_object(self):
        obj = self.request.user
        self.check_object_permissions(self.request, obj)
        return obj

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        if not instance.is_superuser:
            return Response({"msg": "无权限"}, status=status.HTTP_403_FORBIDDEN)
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        msg = self.updata_pwd(request.user, serializer.validated_data)
        if msg:
            return msg
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)


class UserEmailView(generics.GenericAPIView):
    """暂时未开发"""
    pass


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
        return Response(json_data, headers=json_data)
