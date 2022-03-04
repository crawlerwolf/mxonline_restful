# -*- coding: utf-8 -*-

from rest_framework.routers import DefaultRouter

from .views import OrgViewSet, TeacherViewSet, CityDictViewSet, TeacherCourseViewSet
from .views import OrgCourseViewSet, OrgTeacherViewSet, TeacherRankViewSet, TeacherFavViewSet

router = DefaultRouter()

# 机构
router.register('org/list', OrgViewSet, 'org/list')
router.register('org/teacher', OrgTeacherViewSet, 'org/teacher')
router.register('org/course', OrgCourseViewSet, 'org/course')
router.register('city', CityDictViewSet, 'city')

# 教师
router.register('teacher/list', TeacherViewSet, 'teacher/list')
router.register('teacher/course', TeacherCourseViewSet, 'teacher/course')
router.register('teacher/rank', TeacherRankViewSet, 'teacher/rank')
router.register('teacher/fav', TeacherFavViewSet, 'teacher/fav')


urlpatterns = []
urlpatterns += router.urls
