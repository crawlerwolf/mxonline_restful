from django.contrib import admin

from .models import Course, Lesson, Video, CourseResource, BannerCourse
from organization.models import CourseOrg
# Register your models here.


class LessonInline(admin.TabularInline):
    # 添加嵌套章节
    model = Lesson
    extra = 0


class CourseResourceInline(admin.TabularInline):
    # 添加嵌套课程资源
    model = CourseResource
    extra = 0


class CourseAdmin(admin.ModelAdmin):
    list_display = ['name', 'course_org', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums', 'add_time', 'get_zj_nums', 'go_to']
    search_fields = ['name', 'course_org', 'desc', 'detail', 'degree', 'students', 'fav_nums', 'click_nums']
    list_filter = ['name', 'course_org', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums', 'add_time']
    # 定义后台初始状态排序
    ordering = ['-click_nums']
    # 定义列表页可以直接编辑的字段
    list_editable = ['degree', 'desc']
    # 定义后台不可更改字段
    readonly_fields = ['click_nums', 'fav_nums', 'students']
    # 定义后台不显示的字段
    exclude = []
    # 嵌套章节和课程资源
    inlines = [LessonInline, CourseResourceInline]
    # 设置定时刷新
    refresh_times = [3, 5]  # 选择每3秒或者5秒刷新
    # 自定义字段样式style
    style_fields = {'detail': 'ueditor'}  # 字段detail使用样式style为ueditor
    import_excel = True

    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    # 重载admin中的save_models方法保存时加入自己的逻辑
    def save_models(self):
        # 在保存课程的时候统计课程机构的课程数
        obj = self.new_obj  # 固定写法（获取当前新增的course实例），obj为course的对象
        obj.save()  # 先保存合成再统计
        if obj.course_org:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()

    def post(self, request, *args, **kwargs):
        if 'excel' in request.FILES:
            pass
        # 必须返回
        return super(CourseAdmin, self).post(request, args, kwargs)


class BannerCourseAdmin(admin.ModelAdmin):
    list_display = ['name', 'course_org', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums', 'add_time', 'get_zj_nums', 'go_to']
    search_fields = ['name', 'course_org', 'desc', 'detail', 'degree', 'students', 'fav_nums', 'click_nums']
    list_filter = ['name', 'course_org', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums', 'add_time']
    # 定义后台初始状态排序
    ordering = ['-click_nums']
    # 定义列表页可以直接编辑的字段
    list_editable = ['degree', 'desc']
    # 定义后台只读不可更改字段
    readonly_fields = ['click_nums', 'fav_nums', 'students']
    # 定义后台不显示的字段
    exclude = []

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs


class VideoInline(admin.TabularInline):
    # 添加嵌套视频
    model = Video
    extra = 0


class LessonAdmin(admin.ModelAdmin):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']
    # 定义列表页可以直接编辑的字段
    list_editable = ['name']
    # 嵌套视频
    inlines = [VideoInline]


class VideoAdmin(admin.ModelAdmin):
    list_display = ['lesson', 'name', 'url', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'url', 'add_time']
    # 定义列表页可以直接编辑的字段
    list_editable = ['url']


class CourseResourceAdmin(admin.ModelAdmin):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course', 'name', 'add_time']


admin.site.register(Course, CourseAdmin)
admin.site.register(BannerCourse, BannerCourseAdmin)
admin.site.register(Lesson, LessonAdmin)
admin.site.register(Video, VideoAdmin)
admin.site.register(CourseResource, CourseResourceAdmin)
