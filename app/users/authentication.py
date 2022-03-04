# -*- coding: utf-8 -*-
import jwt
from rest_framework.authtoken.models import Token
from rest_framework import authentication
from rest_framework import exceptions
from rest_framework_jwt.settings import api_settings

from .models import UserProfile

jwt_decode_handler = api_settings.JWT_DECODE_HANDLER


class UserAuthentication(authentication.BaseAuthentication):
    """自定义用户drf自带认证"""
    def authenticate(self, request):
        cookies = getattr(request._request, 'COOKIES', None)
        if not cookies:
            raise exceptions.AuthenticationFailed('用户未认证')

        token = cookies.get("token", None)
        if not token:
            raise exceptions.AuthenticationFailed('用户未认证')

        try:
            obj = Token.objects.get(key=token)
            user = UserProfile.objects.get(id=obj.user.id)
        except (UserProfile.DoesNotExist, Token.DoesNotExist):
            raise exceptions.AuthenticationFailed('用户未认证')

        return (user, None)


class UserJWTAuthentication(authentication.BaseAuthentication):
    """自定义用户JWT认证"""
    def authenticate(self, request):
        cookies = getattr(request._request, 'COOKIES', None)
        if not cookies:
            raise exceptions.AuthenticationFailed('用户未认证')

        token = cookies.get("token", None)
        if not token:
            raise exceptions.AuthenticationFailed('用户未认证')

        try:
            payload = jwt_decode_handler(token)
            user = UserProfile.objects.get(id=payload['user_id'])
        except jwt.ExpiredSignature:
            raise exceptions.AuthenticationFailed('签名过期')
        except jwt.DecodeError:
            raise exceptions.AuthenticationFailed('签名验证失败')
        except jwt.InvalidTokenError:
            raise exceptions.AuthenticationFailed('未知错误')

        return (user, None)
