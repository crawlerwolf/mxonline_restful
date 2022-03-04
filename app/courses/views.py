from django.db.models import Q
from django.shortcuts import render
from rest_framework import filters, status, authentication, permissions
from rest_framework import mixins
from rest_framework import viewsets
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework_extensions.cache.mixins import CacheResponseMixin

from operation.models import CourseComments, UserCourse, UserFavorite
from settings import COURSE_USER_RELATE_NUM, COURSE_RELATE_NUM, RESR_JWT, IS_TOKEN
from users.authentication import UserJWTAuthentication, UserAuthentication
from .serializer import CourseSerializer, CourseResourceSerializer, CourseCommentDetailSerializer
from .serializer import CourseInfoSerializer, LessonDetailSerializer, VideoDetailSerializer
from .models import Course, Video


# Create your views here.


class SetPagination(PageNumberPagination):
    page_size = 2
    page_size_query_param = 'page_size'
    max_page_size = 10
    last_page_strings = ['50']


class CourseViewSet(CacheResponseMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        课程
        list:
            获取课程列表
        retrieve:
            依据课程id获取课程信息
    """
    queryset = Course.objects.all()
    pagination_class = SetPagination
    filter_backends = (filters.OrderingFilter, filters.SearchFilter)
    search_fields = ['name', 'desc', 'detail']
    ordering_fields = ['students', 'add_time', 'click_nums']
    ordering = ['-add_time']

    def get_serializer_class(self):
        if self.action == "retrieve":
            return CourseInfoSerializer
        elif self.action == "list":
            return CourseSerializer
        return CourseSerializer

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        # 增加课程点击数
        instance.click_nums += 1
        instance.save()
        serializer = self.get_serializer(instance)
        date = serializer.data
        date['has_fav_course'] = False
        date['has_fav_org'] = False
        if self.request.user.is_authenticated:
            # 课程收藏判断
            if UserFavorite.objects.filter(user=request.user, fav_id=int(instance.id), fav_type=1):
                date['has_fav_course'] = True
            # 机构收藏判断
            if UserFavorite.objects.filter(user=request.user, fav_id=int(instance.course_org.id), fav_type=2):
                date['has_fav_org'] = True
        return Response(date)


class CourseRelateViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    课程相关的课程
        retrieve:
            依据课程id获取与该课程相关的课程
    """
    queryset = Course.objects.all()
    serializer_class = CourseSerializer

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        tag = instance.tag
        if not tag:
            return Response({"msg": "未找到相关信息"}, status=status.HTTP_404_NOT_FOUND)
        course_relate = Course.objects.filter(Q(tag=tag) & ~Q(id=instance.id))[:COURSE_RELATE_NUM]
        if not course_relate:
            return Response({"msg": "未找到相关信息"}, status=status.HTTP_404_NOT_FOUND)
        serializer = self.get_serializer(course_relate, many=True)
        return Response(serializer.data)


class LessonInfoViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        课程章节详情信息
            retrieve:
                依据课程id获取课程章节详细信息
                如果用户未关联该课程则关联课程
    """
    queryset = Course.objects.all()
    serializer_class = LessonDetailSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        # 查询用户是否关联了此课程
        has_course = UserCourse.objects.filter(user=self.request.user, course=instance)
        if not has_course:
            has_course = UserCourse(user=self.request.user, course=instance)
            has_course.save()
            # 学习人数加1
            instance.students += 1
            instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class VideoInfoViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        课程视频详情信息
            retrieve:
                依据视频id获取课程视频详情信息
    """
    queryset = Video.objects.all()
    serializer_class = VideoDetailSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        course = instance.lesson.course
        # 查询用户是否关联了此课程
        has_course = UserCourse.objects.filter(user=self.request.user, course=course)
        if not has_course:
            has_course = UserCourse(user=self.request.user, course=course)
            has_course.save()
            # 学习人数加1
            instance.students += 1
            instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class CourseResourceViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    课程资源信息
        retrieve:
            课程id获取资源详细信息
    """
    queryset = Course.objects.all()
    serializer_class = CourseResourceSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]


class CourseCommentsViewSet(CacheResponseMixin, mixins.CreateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        课程评论
        create:
            依据课程id添加课程评论
        retrieve:
            依据课程id获取课程评论
    """
    queryset = Course.objects.all()
    pagination_class = SetPagination
    serializer_class = CourseCommentDetailSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ['add_time']

    def perform_create(self, serializer):
        date = serializer.validated_data
        date['user'] = self.request.user
        date['course'] = Course.objects.get(id=int(date['course']))
        return serializer.save()

    def retrieve(self, request, *args, **kwargs):
        """获取课程评论详细信息并设置分页"""
        instance = self.get_object()
        user_comments = CourseComments.objects.filter(course=instance
                                                      ).order_by(self.request.query_params.get("ordering", 'add_time'))
        if user_comments:
            user_comments = [CourseComments.objects.get(id=user_comment.id) for user_comment in user_comments]

        page = self.paginate_queryset(user_comments)
        if not page:
            page = user_comments
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class CourseUserRelateViewSet(CacheResponseMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        学习过该课的同学还学过的课程
        retrieve:
            获取学过此课程所有用户学习过的其他所有课程
    """
    queryset = Course.objects.all()
    pagination_class = SetPagination
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = CourseSerializer
    filter_backends = (filters.OrderingFilter,)
    ordering_fields = ['click_nums']

    def retrieve(self, request, *args, **kwargs):
        course = self.get_object()
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.id for user_course in user_courses]
        all_users_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in all_users_courses if
                      user_course.course.id != int(course.id)]
        relate_courses = Course.objects.filter(
            id__in=course_ids).order_by(self.request.query_params.get(
            "ordering", "-click_nums"))[:COURSE_USER_RELATE_NUM]

        serializer = self.get_serializer(relate_courses, many=True)
        return Response(serializer.data)
