# -*- coding: utf-8 -*-
from django.urls import path
from rest_framework.routers import DefaultRouter

from .views import UserProfileViewSet, EmailSendViewSet, UserActiveViewSet
from .views import UserForgetPwdViewSet, UserEmailChangeViewSet

router = DefaultRouter()

# 用户
router.register('user/info', UserProfileViewSet, 'user/info')
router.register('user/active', UserActiveViewSet, 'user/active')
router.register('user/forget', UserForgetPwdViewSet, 'user/forget')
router.register('user/email', UserEmailChangeViewSet, 'user/email')
router.register('email/send', EmailSendViewSet, 'email/send')

urlpatterns = []
urlpatterns += router.urls
