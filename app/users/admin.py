from django.contrib import admin
from django.utils.translation import ugettext_lazy

from .models import EmailVerifyRecord, Banner, UserProfile

# Register your models here.

# 修改管理网站标签页标题
admin.AdminSite.site_title = ugettext_lazy('夜月')
# 修改管理网站标题
admin.AdminSite.site_header = ugettext_lazy('夜月不挂科')
# 修改管理网站首页标题
admin.AdminSite.index_title = ugettext_lazy('夜月')


@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ['username', 'nick_name', 'email', 'mobile', 'address', 'birday', 'gender', 'image', 'is_staff']
    search_fields = ['username', 'nick_name', 'email', 'mobile']
    list_editable = ['nick_name', 'birday', 'gender', 'address', 'image', 'is_staff']


@admin.register(EmailVerifyRecord)
class EmailVerifyRecordAdmin(admin.ModelAdmin):
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email', 'send_type']
    list_filter = ['code', 'email', 'send_type', 'send_time']


@admin.register(Banner)
class BannerAdmin(admin.ModelAdmin):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']
