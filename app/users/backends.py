# -*- coding: utf-8 -*-
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import check_password
from django.db.models import Q

from .models import UserProfile


class UserModelBackend(ModelBackend):
    """
    自定义用户验证
    """
    def authenticate(self, username=None, password=None, **kwargs):
        if username is None:
            return None
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username) | Q(mobile=username))
            if password is None:
                return user
        except UserProfile.DoesNotExist:
            return None
        else:
            if check_password(password, user.password) and self.user_can_authenticate(user):
                return user
