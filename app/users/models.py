# _*_ coding: utf-8 _*_
from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class UserProfile(AbstractUser):  # 修改默认用户表增加所需字段
    nick_name = models.CharField(max_length=50, verbose_name=u'昵称', default='', help_text="昵称")
    birday = models.CharField(max_length=10, verbose_name=u'生日', default='', null=True,
                              blank=True, help_text="生日")
    gender = models.CharField(max_length=6, choices=(('male', u'男'), ('female', u'女')),
                              verbose_name=u'性别', default='female', help_text="性别")
    address = models.CharField(max_length=100, default='', null=True, blank=True, help_text="地址")
    mobile = models.CharField(max_length=11, default='', null=True, blank=True, help_text="手机号")
    image = models.ImageField(upload_to='image/%Y/%m', default='image/default.png', max_length=100,
                              null=True, blank=True, help_text="头像")

    class Mate:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def unread_nums(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id, has_read=False).count()

    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):  # 添加功能 邮箱验证/注册/密码找回
    code = models.CharField(max_length=20, verbose_name=u'验证码')
    email = models.EmailField(max_length=50, verbose_name=u'邮箱')
    send_type = models.CharField(choices=(('register', u'注册'), ('forget', u'找回密码'), ('updata_email', u'修改邮箱')), max_length=30, verbose_name=u'验证码类型')
    send_time = models.DateTimeField(default=datetime.now,  verbose_name=u'发送时间')

    class Meta:
        verbose_name = u'邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):  # 添加功能 轮播图
    title = models.CharField(max_length=100, verbose_name=u'标题')
    image = models.ImageField(upload_to='banner/%Y/%m', verbose_name=u'轮播图', max_length=100)
    url = models.URLField(max_length=200, verbose_name=u'访问地址')
    index = models.IntegerField(default=100, verbose_name=u'顺序')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'轮播图'
        verbose_name_plural = verbose_name
