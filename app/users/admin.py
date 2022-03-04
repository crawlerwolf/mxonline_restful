from django.contrib import admin

from .models import EmailVerifyRecord, Banner
# Register your models here.


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
