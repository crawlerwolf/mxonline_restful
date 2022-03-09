from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import mixins
from rest_framework.pagination import PageNumberPagination
from rest_framework import filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework_extensions.cache.mixins import CacheResponseMixin

from courses.models import Course
from operation.models import UserFavorite
from settings import TEACHER_RANK_NUM, TEACHER_FAV_NUM
from .models import CourseOrg, CityDict, Teacher
from .serializer import OrgSerializer, OrgDetailSerializer, OrgTeacherDetailSerializer, OrgCourseDetailSerializer
from .serializer import CityDictSerializer, TeacherSerializer, TeacherDetailSerializer
from .filters import TeacherFilter

# Create your views here.


class SetPagination(PageNumberPagination):
    """设置分页"""
    page_size = 2
    page_size_query_param = 'page_size'
    max_page_size = 10
    last_page_strings = ['50']


class OrgViewSet(CacheResponseMixin, viewsets.ReadOnlyModelViewSet):
    """
    机构信息
    list:
        获取机构列表
    retrieve:
        获取机构详情信息
    """
    queryset = CourseOrg.objects.all()
    pagination_class = SetPagination
    filter_backends = (DjangoFilterBackend, filters.OrderingFilter, filters.SearchFilter)
    filterset_fields = ['city', 'category']
    search_fields = ['name', 'desc']
    ordering_fields = ['students', 'course_nums', 'add_time']
    ordering = ['-add_time']

    def get_serializer_class(self):
        """
        不同的请求获取对应的数据
        list:
            对应OrgSerializer数据的
        retrieve:
            对应OrgDetailSerializer数据的
        """
        if self.action == "retrieve":
            return OrgDetailSerializer
        elif self.action == "list":
            return OrgSerializer
        return OrgSerializer

    def retrieve(self, request, *args, **kwargs):
        """设置机构点击数"""
        instance = self.get_object()
        instance.click_nums += 1
        instance.save()
        serializer = self.get_serializer(instance)
        date = serializer.data
        date['has_fav'] = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=self.request.user, fav_id=int(instance.id), fav_type=2):
                date['has_fav'] = True
        return Response(date)


class OrgTeacherViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    机构教师
    retrieve:
        获取机构教师信息
    """
    queryset = CourseOrg.objects.all()
    serializer_class = OrgTeacherDetailSerializer
    pagination_class = SetPagination

    def retrieve(self, request, *args, **kwargs):
        """获取机构教师信息并设置分页"""
        instance = self.get_object()
        org_teacher = Teacher.objects.filter(org=instance)

        page = self.paginate_queryset(org_teacher)
        if not page:
            page = org_teacher
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class OrgCourseViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    机构课程
    retrieve:
        获取机构课程信息
    """
    queryset = CourseOrg.objects.all()
    serializer_class = OrgCourseDetailSerializer
    pagination_class = SetPagination

    def retrieve(self, request, *args, **kwargs):
        """获取机构课程信息并设置分页"""
        instance = self.get_object()
        org_course = Course.objects.filter(course_org=instance)

        page = self.paginate_queryset(org_course)
        if not page:
            page = org_course
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class CityDictViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    城市信息
    list:
        获取城市信息
    """
    queryset = CityDict.objects.all()
    serializer_class = CityDictSerializer


class TeacherViewSet(CacheResponseMixin, viewsets.ReadOnlyModelViewSet):
    """
    教师信息
    list:
        获取教师列表
    retrieve:
        获取教师详情信息
    """
    queryset = Teacher.objects.all()
    pagination_class = SetPagination
    filter_backends = (DjangoFilterBackend, filters.OrderingFilter, filters.SearchFilter)
    filterset_class = TeacherFilter
    search_fields = ['name', 'work_company', 'work_position']
    ordering_fields = ['click_nums', 'add_time']
    ordering = ['-add_time']

    def get_serializer_class(self):
        """
        不同的请求获取对应的数据
        list:
            对应TeacherSerializer数据的
        retrieve:
            对应TeacherDetailSerializer数据的
        """
        if self.action == "retrieve":
            return TeacherDetailSerializer
        elif self.action == "list":
            return TeacherSerializer
        return TeacherSerializer

    def retrieve(self, request, *args, **kwargs):
        """设置教师点击数"""
        instance = self.get_object()
        instance.click_nums += 1
        instance.save()
        serializer = self.get_serializer(instance)
        date = serializer.data
        # 讲师是否收藏
        date['has_teacher_fav'] = False
        # 机构是否收藏
        date['has_org_fav'] = False
        if self.request.user.is_authenticated:
            if UserFavorite.objects.filter(user=self.request.user, fav_type=3, fav_id=int(instance.id)):
                date['has_teacher_fav'] = True

            if UserFavorite.objects.filter(user=self.request.user, fav_type=2, fav_id=int(instance.org.id)):
                date['has_org_fav'] = True
        return Response(date)


class TeacherCourseViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    教师课程信息
    retrieve:
        获取教师课程信息
    """
    queryset = Teacher.objects.all()
    serializer_class = OrgCourseDetailSerializer
    pagination_class = SetPagination
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ['add_time']

    def retrieve(self, request, *args, **kwargs):
        """获取教师课程列表"""
        instance = self.get_object()

        teacher_course = Course.objects.filter(teacher=instance).order_by(
            self.request.query_params.get("ordering", 'add_time'))

        page = self.paginate_queryset(teacher_course)
        if not page:
            page = teacher_course
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class TeacherRankViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    教师排行信息
    list:
        获取教师排行信息
    """
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ['click_nums']

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(
            self.get_queryset().order_by(self.request.query_params.get(
            "ordering", '-click_nums'))
        )

        serializer = self.get_serializer(queryset[:TEACHER_RANK_NUM], many=True)
        return Response(serializer.data)


class TeacherFavViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    学生最喜欢的教师排行信息
    list:
        获取学生最喜欢的教师排行信息
    """
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ['fac_nums']

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(
            self.get_queryset().order_by(self.request.query_params.get(
            "ordering", '-fac_nums'))
        )

        serializer = self.get_serializer(queryset[:TEACHER_FAV_NUM], many=True)
        return Response(serializer.data)

