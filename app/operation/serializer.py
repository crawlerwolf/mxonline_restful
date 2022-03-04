# -*- coding: utf-8 -*-
import re

from rest_framework import serializers

from courses.models import Course
from organization.models import CourseOrg, Teacher
from users.serializer import mobile_reg

from .models import UserMessage, UserFavorite, UserAsk


class UserAskSerializer(serializers.ModelSerializer):
    """
    用户咨询信息
    """
    name = serializers.CharField(required=True, max_length=20, label=u'姓名')
    mobile = serializers.CharField(required=True, validators=[mobile_reg], label=u'手机号')
    add_time = serializers.DateTimeField(required=False, read_only=True,
                                         format='%Y-%m-%d %H:%M', label=u'时间')
    course_name = serializers.CharField(required=True, max_length=50, label=u'课程名',
                                        error_messages={
                                            'max_length': '超过字数限制'
                                        })

    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name', 'add_time']


class UserCourseSerializer(serializers.ModelSerializer):
    """
    用户课程信息
    """
    course_org = serializers.CharField(source='course_org.name')

    class Meta:
        model = Course
        fields = ['id', 'name', 'learn_times', 'students', 'fav_nums', 'image', 'course_org']


class UserFavoriteSerializer(serializers.ModelSerializer):
    """
    用户收藏课程信息
    """
    add_time = serializers.DateTimeField(required=False, read_only=True,
                                         format='%Y-%m-%d %H:%M', help_text='时间', label='时间')
    fav_type = serializers.IntegerField(max_value=3, min_value=1, label='收藏类型',
                                        error_messages={"max_value": "类型错误",
                                                        "min_value": "类型错误"},
                                        help_text='''收藏类型('1', '课程'), ('2', '课程机构'), ('3', '讲师')''')
    fav_id = serializers.IntegerField(help_text='数据id', label='数据id')

    class Meta:
        model = UserFavorite
        fields = ['fav_id', 'fav_type', 'add_time']


class UserFavoriteCourseSerializer(serializers.ModelSerializer):
    """
    用户收藏课程信息
    """
    course_org = serializers.CharField(source='course_org.name')

    class Meta:
        model = Course
        fields = ['id', 'name', 'learn_times', 'students', 'fav_nums', 'image', 'course_org']


class UserFavoriteOrgSerializer(serializers.ModelSerializer):
    """
    用户收藏机构信息
    """

    class Meta:
        model = CourseOrg
        fields = ['id', 'name',  'image', 'address']


class UserFavoriteTeacherSerializer(serializers.ModelSerializer):
    """
    用户收藏教师信息
    """
    class Meta:
        model = Teacher
        fields = ['id', 'name', 'work_years', 'work_company', 'work_position', 'points', 'image']


class CourseMessageSerializer(serializers.ModelSerializer):
    """
    用户消息
    """
    add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d %H:%M')

    class Meta:
        model = UserMessage
        fields = ['id', 'message', 'has_read', 'add_time']
