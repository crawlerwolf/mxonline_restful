from django.shortcuts import render

# Create your views here.
from rest_framework import mixins, viewsets, authentication, permissions, filters, status
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from courses.models import Course
from organization.models import Teacher, CourseOrg
from settings import RESR_JWT, IS_TOKEN
from users.authentication import UserAuthentication, UserJWTAuthentication
from users.models import UserProfile
from .models import UserFavorite, UserCourse, UserMessage
from .serializer import UserCourseSerializer, CourseMessageSerializer, UserFavoriteSerializer, UserAskSerializer
from .serializer import UserFavoriteCourseSerializer, UserFavoriteTeacherSerializer, UserFavoriteOrgSerializer


class SetPagination(PageNumberPagination):
    """设置分页"""
    page_size = 2
    page_size_query_param = 'page_size'
    max_page_size = 10
    last_page_strings = ['50']


class UserAskViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
        用户咨询
            create:
                添加用户咨询信息
    """
    serializer_class = UserAskSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]


class UserCourseViewSet(mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        用户课程
            retrieve:
                获取用户课程信息
    """
    queryset = UserProfile.objects.all()
    serializer_class = UserCourseSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = SetPagination
    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['add_time']

    def get_object(self):
        obj = self.request.user
        self.check_object_permissions(self.request, obj)
        return obj

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        user_courses = UserCourse.objects.filter(user=instance).order_by(self.request.query_params.get(
            "ordering", 'add_time'))
        if user_courses:
            user_courses = [course_date.course for course_date in user_courses]

        page = self.paginate_queryset(user_courses)
        if not page:
            page = user_courses
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class UserFavoriteViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
        用户收藏
            create:
                添加用户收藏信息
    """
    serializer_class = UserFavoriteSerializer
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]

    def fav_creat(self, fav_type, fav_id):
        if int(fav_type) == 1:
            try:
                course = Course.objects.get(id=int(fav_id))
            except Course.DoesNotExist:
                return Response({"msg": "课程不存在"}, status=status.HTTP_404_NOT_FOUND)
            course.fav_nums += 1
            course.save()
        elif int(fav_type) == 2:
            try:
                course_org = CourseOrg.objects.get(id=int(fav_id))
            except CourseOrg.DoesNotExist:
                return Response({"msg": "机构不存在"}, status=status.HTTP_404_NOT_FOUND)
            course_org.fac_nums += 1
            course_org.save()
        elif int(fav_type) == 3:
            try:
                teacher = Teacher.objects.get(id=int(fav_id))
            except Teacher.DoesNotExist:
                return Response({"msg": "教师不存在"}, status=status.HTTP_404_NOT_FOUND)
            teacher.fac_nums += 1
            teacher.save()

    def fav_del(self, fav_type, fav_id):
        if int(fav_type) == 1:
            try:
                course = Course.objects.get(id=int(fav_id))
            except Course.DoesNotExist:
                return Response({"msg": "课程不存在"}, status=status.HTTP_404_NOT_FOUND)
            course.fav_nums -= 1
            if course.fav_nums < 0:
                course.fav_nums = 0
            course.save()
        elif int(fav_type) == 2:
            try:
                course_org = CourseOrg.objects.get(id=int(fav_id))
            except CourseOrg.DoesNotExist:
                return Response({"msg": "机构不存在"}, status=status.HTTP_404_NOT_FOUND)
            course_org.fac_nums -= 1
            if course_org.fac_nums < 0:
                course_org.fac_nums = 0
            course_org.save()
        elif int(fav_type) == 3:
            try:
                teacher = Teacher.objects.get(id=int(fav_id))
            except Teacher.DoesNotExist:
                return Response({"msg": "教师不存在"}, status=status.HTTP_404_NOT_FOUND)
            teacher.fac_nums -= 1
            if teacher.fac_nums < 0:
                teacher.fac_nums = 0
            teacher.save()
        return Response({"msg": "收藏已取消"}, status=status.HTTP_201_CREATED)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        date = serializer.validated_data
        date['user'] = self.request.user
        fav_type = date["fav_type"]
        fav_id = date["fav_id"]
        exist_records = UserFavorite.objects.filter(user=date['user'], fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            msg = self.fav_del(fav_type, fav_id)
            exist_records.delete()
            return msg
        msg = self.fav_creat(fav_type, fav_id)
        return msg


class UserFavoriteCourseViewSet(mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        用户收藏课程
            retrieve:
                获取用户收藏课程信息
    """
    queryset = UserProfile.objects.all()
    serializer_class = UserFavoriteCourseSerializer
    pagination_class = SetPagination
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['add_time']

    def get_object(self):
        obj = self.request.user
        self.check_object_permissions(self.request, obj)
        return obj

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()

        fav_courses = UserFavorite.objects.filter(user=instance, fav_type=1).order_by(self.request.query_params.get(
            "ordering", 'add_time'))

        if fav_courses:
            fav_courses = [Course.objects.get(id=course_date.fav_id) for course_date in fav_courses]

        page = self.paginate_queryset(fav_courses)
        if not page:
            page = fav_courses
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class UserFavoriteTeacherViewSet(mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        用户收藏教师
            retrieve:
                获取用户收藏教师信息
    """
    queryset = UserProfile.objects.all()
    serializer_class = UserFavoriteTeacherSerializer
    pagination_class = SetPagination
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['add_time']

    def get_object(self):
        obj = self.request.user
        self.check_object_permissions(self.request, obj)
        return obj

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        fav_teachers = UserFavorite.objects.filter(user=instance, fav_type=3).order_by(self.request.query_params.get(
            "ordering", 'add_time'))

        if fav_teachers:
            fav_teachers = [Teacher.objects.get(id=teacher_date.fav_id) for teacher_date in fav_teachers]

        page = self.paginate_queryset(fav_teachers)
        if not page:
            page = fav_teachers
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class UserFavoriteOrgViewSet(mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        用户收藏机构
            retrieve:
                获取用户收藏机构信息
    """
    queryset = UserProfile.objects.all()
    serializer_class = UserFavoriteOrgSerializer
    pagination_class = SetPagination
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['add_time']

    def get_object(self):
        obj = self.request.user
        self.check_object_permissions(self.request, obj)
        return obj

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        fav_orgs = UserFavorite.objects.filter(user=instance, fav_type=2).order_by(self.request.query_params.get(
            "ordering", 'add_time'))

        if fav_orgs:
            fav_orgs = [CourseOrg.objects.get(id=org_date.fav_id) for org_date in fav_orgs]

        page = self.paginate_queryset(fav_orgs)
        if not page:
            page = fav_orgs
        serializer = self.get_serializer(page, many=True)
        return self.get_paginated_response(serializer.data)


class CourseMessageViewSet(mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
        用户消息
            retrieve:
                获取用户消息信息
    """
    queryset = UserProfile.objects.all()
    serializer_class = CourseMessageSerializer
    pagination_class = SetPagination
    authentication_classes = [authentication.SessionAuthentication]
    if IS_TOKEN:
        if RESR_JWT:
            authentication_classes.insert(0, UserJWTAuthentication)
        else:
            authentication_classes.insert(0, UserAuthentication)
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [filters.OrderingFilter]
    ordering_fields = ['add_time']

    def get_object(self):
        obj = self.request.user
        self.check_object_permissions(self.request, obj)
        return obj

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        # 将未读信息转为已读信息
        all_message_unread = UserMessage.objects.filter(user=self.request.user.id, has_read=False).all()
        for message_unread in all_message_unread:
            message_unread.has_read = True
            message_unread.save()

        # 获取所有已读信息
        user_messages_read = UserMessage.objects.filter(user=instance.id).order_by(self.request.query_params.get(
            "ordering", 'add_time'))

        page = self.paginate_queryset(user_messages_read)
        if not page:
            page = user_messages_read
        serializer = self.get_serializer(page, many=True)

        return self.get_paginated_response(serializer.data)
