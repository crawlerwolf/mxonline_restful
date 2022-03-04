# -*- coding: utf-8 -*-
from django.urls import path
from rest_framework.routers import DefaultRouter
from .views import UserProfileViewSet, UserEmailView, CaptchaView, UserLoginViewSet, UserLogoutView

router = DefaultRouter()

# 用户
router.register('user/info', UserProfileViewSet, 'user/info')
router.register('login', UserLoginViewSet, 'login')

urlpatterns = [
    path('user/email', UserEmailView.as_view(), name='user/email'),
    path('captcha/', CaptchaView.as_view(), name='captcha/'),
    path('logout/', UserLogoutView.as_view(), name='logout/'),
]
urlpatterns += router.urls
