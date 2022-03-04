# -*- coding: utf-8 -*-
from rest_framework import serializers

from settings import ORG_INFO_TEACHER_NUM, ORG_INFO_COURSE_NUM
from .models import CourseOrg, CityDict, Teacher
from courses.models import Course


class CityDictSerializer(serializers.ModelSerializer):
    """
    城市信息
    """
    class Meta:
        model = CityDict
        fields = ["name"]


class OrgTeacherDetailSerializer(serializers.ModelSerializer):
    """机构教师信息"""
    class Meta:
        model = Teacher
        fields = ['id', 'name', 'work_years', 'image', 'course_nums']


class OrgCourseDetailSerializer(serializers.ModelSerializer):
    """机构课程信息"""

    class Meta:
        model = Course
        fields = ['id', 'name', 'learn_times', 'students', 'fav_nums', 'image']


class OrgSerializer(serializers.ModelSerializer):
    """机构信息"""

    class Meta:
        model = CourseOrg
        fields = ['id', 'name', 'desc', 'add_time', 'students',
                  'image', 'address', 'course_nums', 'teacher_nums']


class OrgDetailSerializer(serializers.ModelSerializer):
    """机构详情信息"""
    courses = serializers.SerializerMethodField()
    teachers = serializers.SerializerMethodField()

    def get_courses(self, obj):
        """获取机构课程"""
        all_courses = {}
        course_set = Course.objects.filter(course_org_id=obj.id)
        if course_set:
            all_courses = OrgCourseDetailSerializer(course_set.all()[:ORG_INFO_COURSE_NUM], many=True,
                                               context={'request': self.context['request']}).data
        return all_courses

    def get_teachers(self, obj):
        """"获取机构教师"""
        all_teacher = {}
        teacher_set = Teacher.objects.filter(org__id=obj.id)
        if teacher_set:
            all_teacher = OrgTeacherDetailSerializer(teacher_set.all()[:ORG_INFO_TEACHER_NUM], many=True,
                                                context={'request': self.context['request']}).data
        return all_teacher

    class Meta:
        model = CourseOrg
        fields = ['id', 'city', 'category', 'course_nums', 'teacher_nums', 'name', 'desc', 'tag',
                  'courses', 'teachers', 'students', 'click_nums', 'fac_nums', 'image', 'address']


class TeacherSerializer(serializers.ModelSerializer):
    """教师信息"""

    class Meta:
        model = Teacher
        fields = ['id', 'name', 'age', 'work_years', 'work_company', 'work_position', 'points', 'image']


class TeacherDetailSerializer(serializers.ModelSerializer):
    """教师详情"""
    org = OrgSerializer()
    add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d %H:%M')

    class Meta:
        model = Teacher
        fields = ['id', 'name', 'age', 'work_years', 'work_company',
                  'work_position', 'points', 'image', 'org', 'add_time']
