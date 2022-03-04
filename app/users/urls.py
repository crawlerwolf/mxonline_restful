# -*- coding: utf-8 -*-
from django.urls import path
from rest_framework.routers import DefaultRouter
from .views import UserProfileViewSet, UserEmailView

router = DefaultRouter()

# 用户
router.register('user/info', UserProfileViewSet, 'user/info')

urlpatterns = [
    path('user/email', UserEmailView.as_view(), name='user/email'),
]
urlpatterns += router.urls
