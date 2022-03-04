from django.contrib import admin

from .models import UserAsk, CourseComments, UserFavorite, UserMessage, UserCourse
# Register your models here.


@admin.register(UserAsk)
class UserAskAdmin(admin.ModelAdmin):
    list_display = ['name', 'mobile', 'course_name', 'add_time']
    search_fields = ['name', 'mobile', 'course_name']
    list_filter = ['name', 'mobile', 'course_name', 'add_time']


@admin.register(CourseComments)
class CourseCommentsAdmin(admin.ModelAdmin):
    list_display = ['user', 'course', 'comments', 'add_time']
    search_fields = ['user', 'course', 'comments']
    list_filter = ['user', 'course', 'comments', 'add_time']


@admin.register(UserFavorite)
class UserFavoriteAdmin(admin.ModelAdmin):
    list_display = ['user', 'fav_id', 'fav_type', 'add_time']
    search_fields = ['user', 'fav_id', 'fav_type']
    list_filter = ['user', 'fav_id', 'fav_type', 'add_time']


@admin.register(UserMessage)
class UserMessageAdmin(admin.ModelAdmin):
    list_display = ['user', 'message', 'has_read', 'add_time']
    search_fields = ['user', 'message', 'has_read']
    list_filter = ['user', 'message', 'has_read', 'add_time']


@admin.register(UserCourse)
class UserCourseAdmin(admin.ModelAdmin):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course']
    list_filter = ['user', 'course', 'add_time']
