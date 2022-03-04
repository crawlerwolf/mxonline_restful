# -*- coding: utf-8 -*-
from rest_framework import serializers

from operation.models import CourseComments
from organization.serializer import OrgSerializer, TeacherSerializer
from .models import Course, CourseResource, Lesson, Video


class VideoSerializer(serializers.ModelSerializer):
    """视频详情信息"""
    course_id = serializers.IntegerField(source='lesson.course.id')

    class Meta:
        model = Video
        fields = ['id', "name", "url", "course_id"]


class LessonSerializer(serializers.ModelSerializer):
    """章节详情信息"""
    video = serializers.SerializerMethodField()

    def get_video(self, obj):
        """获取章节视频"""
        video_data = {}
        videos = Video.objects.filter(lesson__id=obj.id)
        if videos:
            video_data = VideoSerializer(videos.all(), many=True,
                                         context={'request': self.context['request']}).data
        return video_data

    class Meta:
        model = Lesson
        fields = ['id', "name", 'video']


class CourseSerializer(serializers.ModelSerializer):
    """课程信息"""
    org_name = serializers.CharField(source="course_org.name")

    class Meta:
        model = Course
        fields = ['id', 'name', 'learn_times', 'students', 'fav_nums', 'image', 'org_name', 'is_banner']


class CourseInfoSerializer(serializers.ModelSerializer):
    """课程详情信息"""
    course_org = OrgSerializer()

    class Meta:
        model = Course
        fields = "__all__"


class VideoDetailSerializer(serializers.ModelSerializer):
    """视频详情信息"""
    lesson = serializers.SerializerMethodField()
    teacher = serializers.SerializerMethodField()
    course_id = serializers.IntegerField(source='lesson.course.id')

    def get_teacher(self, obj):
        """获取课程讲师"""
        teacher_data = {}
        teacher = Lesson.objects.get(id=obj.lesson.id).course.teacher
        if teacher:
            teacher_data = TeacherSerializer(teacher, many=False,
                                           context={'request': self.context['request']}).data
        return teacher_data

    def get_lesson(self, obj):
        """获取课程章节"""
        lesson_data = {}
        lessons = Lesson.objects.filter(id=obj.lesson.id)
        if lessons:
            lesson_data = LessonSerializer(lessons.all(), many=True,
                                           context={'request': self.context['request']}).data
        return lesson_data

    class Meta:
        model = Video
        fields = ['id', "name", "url", 'lesson', 'teacher', 'course_id']


class LessonDetailSerializer(serializers.ModelSerializer):
    """课程章节详情信息"""
    lesson = serializers.SerializerMethodField()
    teacher = TeacherSerializer()

    def get_lesson(self, obj):
        """获取课程章节"""
        lesson_data = {}
        lessons = Lesson.objects.filter(course_id=obj.id)
        if lessons:
            lesson_data = LessonSerializer(lessons.all(), many=True,
                                           context={'request': self.context['request']}).data
        return lesson_data

    class Meta:
        model = Course
        fields = ['name', 'learn_times', 'students', 'degree', 'lesson', 'teacher_tell', 'teacher', 'need_know']


class CourseResourceDetailSerializer(serializers.ModelSerializer):
    """资源信息"""
    class Meta:
        model = CourseResource
        fields = ['name', 'download']


class CourseResourceSerializer(serializers.ModelSerializer):
    """课程资源信息"""
    resource = serializers.SerializerMethodField()

    def get_resource(self, obj):
        """获取课程资源"""
        sources_data = {}
        sources = CourseResource.objects.filter(course_id=obj.id)
        if sources:
            sources_data = CourseResourceDetailSerializer(sources.all(), many=True,
                                                          context={'request': self.context['request']}).data
        return sources_data

    class Meta:
        model = Course
        fields = ['resource']


class CourseCommentDetailSerializer(serializers.ModelSerializer):
    """课程评论信息"""
    add_time = serializers.DateTimeField(required=False, read_only=True,
                                         format='%Y-%m-%d %H:%M', help_text='时间', label='时间')
    nick_name = serializers.CharField(read_only=True, required=False,
                                      source='user.nick_name', help_text='昵称', label='昵称')
    course = serializers.IntegerField(write_only=True, help_text='课程', label='课程')
    user = serializers.IntegerField(source='user.nickname', required=False, read_only=True,  help_text='用户', label='用户')

    class Meta:
        model = CourseComments
        fields = ['nick_name', 'comments', 'add_time', 'course', 'user']

