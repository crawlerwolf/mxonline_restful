# -*- coding: utf-8 -*-

from rest_framework.routers import DefaultRouter
from .views import UserCourseViewSet, CourseMessageViewSet, UserFavoriteViewSet, UserAskViewSet
from .views import UserFavoriteCourseViewSet, UserFavoriteOrgViewSet, UserFavoriteTeacherViewSet

router = DefaultRouter()

# 用户操作
router.register('operation/course', UserCourseViewSet, 'operation/course')
router.register('operation/fav', UserFavoriteViewSet, 'operation/fav')
router.register('operation/fav/org', UserFavoriteOrgViewSet, 'operation/fav/org')
router.register('operation/fav/teacher', UserFavoriteTeacherViewSet, 'operation/fav/teacher')
router.register('operation/fav/course', UserFavoriteCourseViewSet, 'operation/fav/course')
router.register('operation/message', CourseMessageViewSet, 'operation/message')
router.register('operation/ask', UserAskViewSet, 'operation/ask')


urlpatterns = []
urlpatterns += router.urls
