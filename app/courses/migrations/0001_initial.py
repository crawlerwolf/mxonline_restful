# Generated by Django 3.2.12 on 2022-02-21 15:26

import DjangoUeditor.models
import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='课程名称')),
                ('desc', models.CharField(max_length=300, verbose_name='课程描述')),
                ('detail', DjangoUeditor.models.UEditorField(default='', verbose_name='课程详情')),
                ('is_banner', models.BooleanField(default=False, verbose_name='是否轮播')),
                ('degree', models.CharField(choices=[('cj', '初级'), ('zj', '中级'), ('gj', '高级')], max_length=2, verbose_name='课程难度')),
                ('need_know', models.CharField(default='', max_length=300, verbose_name='课程须知')),
                ('learn_times', models.IntegerField(default=0, verbose_name='学习时长(分钟数)')),
                ('students', models.IntegerField(default=0, verbose_name='学习人数')),
                ('fav_nums', models.IntegerField(default=0, verbose_name='收藏人数')),
                ('teacher_tell', models.CharField(default='', max_length=300, verbose_name='老师告诉你')),
                ('image', models.ImageField(blank=True, null=True, upload_to='courses/%Y/%m', verbose_name='课程封面')),
                ('click_nums', models.IntegerField(default=0, verbose_name='点击数')),
                ('category', models.CharField(default='后端开发', max_length=20, verbose_name='课程类别')),
                ('tag', models.CharField(default='', max_length=10, verbose_name='课程标签')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间')),
                ('course_org', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='organization.courseorg', verbose_name='课程机构')),
                ('teacher', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='organization.teacher', verbose_name='课程讲师')),
            ],
            options={
                'verbose_name': '课程',
                'verbose_name_plural': '课程',
            },
        ),
        migrations.CreateModel(
            name='Lesson',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='章节名称')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='courses.course', verbose_name='课程')),
            ],
            options={
                'verbose_name': '章节',
                'verbose_name_plural': '章节',
            },
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='视频名称')),
                ('url', models.CharField(default='', max_length=200, verbose_name='访问地址')),
                ('learn_times', models.IntegerField(default=0, verbose_name='学习时长(分钟数)')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间')),
                ('lesson', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='courses.lesson', verbose_name='章节')),
            ],
            options={
                'verbose_name': '视频',
                'verbose_name_plural': '视频',
            },
        ),
        migrations.CreateModel(
            name='CourseResource',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='课程名称')),
                ('download', models.FileField(upload_to='course/resource/%Y/%m', verbose_name='资源文件')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='courses.course', verbose_name='课程')),
            ],
            options={
                'verbose_name': '课程资源',
                'verbose_name_plural': '课程资源',
            },
        ),
        migrations.CreateModel(
            name='BannerCourse',
            fields=[
            ],
            options={
                'verbose_name': '轮播课程',
                'verbose_name_plural': '轮播课程',
                'proxy': True,
                'indexes': [],
                'constraints': [],
            },
            bases=('courses.course',),
        ),
    ]
