from django.contrib import admin

from .models import CityDict, CourseOrg, Teacher
# Register your models here.


@admin.register(CityDict)
class CityDictAdmin(admin.ModelAdmin):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']


@admin.register(CourseOrg)
class CourseOrgAdmin(admin.ModelAdmin):
    list_display = ['name', 'desc', 'category', 'click_nums', 'fac_nums', 'address', 'city', 'add_time']
    search_fields = ['name', 'desc', 'category', 'click_nums', 'fac_nums', 'address', 'city']
    list_filter = ['name', 'desc', 'category', 'click_nums', 'fac_nums', 'address', 'city', 'add_time']
    # 当有外键指向此处时以ajax形式加载（搜索形式展现非下拉式）
    relfield_style = 'fk-ajax'


@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_display = ['org', 'name', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fac_nums', 'add_time']
    search_fields = ['org', 'name', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fac_nums']
    list_filter = ['org', 'name', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fac_nums', 'add_time']

