# -*- coding: utf-8 -*-

from rest_framework.routers import DefaultRouter

from .views import CourseViewSet, LessonInfoViewSet, CourseRelateViewSet, VideoInfoViewSet
from .views import CourseResourceViewSet, CourseCommentsViewSet, CourseUserRelateViewSet

router = DefaultRouter()

# 课程
router.register(r'courses/list', CourseViewSet, "courses/list")
router.register(r'courses/lesson', LessonInfoViewSet, "courses/lesson")
router.register(r'courses/video', VideoInfoViewSet, "courses/video")
router.register(r'courses/relate', CourseRelateViewSet, "courses/relate")
router.register(r'courses/resource', CourseResourceViewSet, "courses/resource")
router.register(r'courses/comment', CourseCommentsViewSet, "courses/comment")
router.register(r'courses/user/relate', CourseUserRelateViewSet, "courses/user/relate")

urlpatterns = []
urlpatterns += router.urls
