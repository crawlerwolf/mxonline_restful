# _*_ coding: utf-8 _*_
from datetime import datetime

from django.db import models
# Create your models here.


class CityDict(models.Model):  # 添加功能 城市
    name = models.CharField(max_length=20, verbose_name=u'城市')
    desc = models.CharField(max_length=200, verbose_name=u'描述')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'城市'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseOrg(models.Model):  # 添加功能 教学机构
    name = models.CharField(max_length=50, verbose_name=u'机构名称')
    desc = models.TextField(verbose_name=u'机构简介')
    tag = models.CharField(default=u'全国知名', max_length=10, verbose_name=u'机构标签')
    category = models.CharField(default='pxjg', max_length=20, verbose_name=u'机构类别', choices=(('pxjg', u'培训机构'), ('gx', u'高校'), ('gr', u'个人')))
    click_nums = models.IntegerField(default=0, verbose_name=u'点击数')
    fac_nums = models.IntegerField(default=0, verbose_name=u'收藏数')
    image = models.ImageField(default='', upload_to='Org/%Y/%m', verbose_name=u'logo', null=True, blank=True)
    address = models.CharField(max_length=150, verbose_name=u'机构地址')
    city = models.ForeignKey(CityDict, on_delete=models.CASCADE, verbose_name=u'所在城市')
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程机构'
        verbose_name_plural = verbose_name

    @property
    def course_nums(self):
        # 教学机构的课程数量
        return self.course_set.all().count()

    def teacher_nums(self):
        # 教学机构的教师数量
        return self.teacher_set.all().count()

    def __str__(self):
        return self.name


class Teacher(models.Model):  # 添加功能 教师
    org = models.ForeignKey(CourseOrg, on_delete=models.CASCADE, verbose_name=u'所属机构')
    name = models.CharField(max_length=100, verbose_name=u'教师名称')
    age = models.CharField(max_length=10, verbose_name=u'教师年龄', null=True, blank=True)
    work_years = models.IntegerField(default=0, verbose_name=u'工作年限')
    work_company = models.CharField(max_length=50, verbose_name=u'就职公司')
    work_position = models.CharField(max_length=50, verbose_name=u'公司职位')
    points = models.CharField(max_length=50, verbose_name=u'教学特点')
    image = models.ImageField(default='', upload_to='teacher/%Y/%m', verbose_name=u'头像', null=True, blank=True)
    click_nums = models.IntegerField(default=0, verbose_name=u'点击数')
    fac_nums = models.IntegerField(default=0, verbose_name=u'收藏数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'教师'
        verbose_name_plural = verbose_name

    @property
    def course_nums(self):
        return self.course_set.all().count()

    def __str__(self):
        return self.name
