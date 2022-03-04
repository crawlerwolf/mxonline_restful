# -*- coding: utf-8 -*-
import datetime

"""APP中参数设置"""

# 学习过该课的同学还学过的课程接口返回数量
COURSE_USER_RELATE_NUM = 5

# 与课程相关的课程接口返回数量
COURSE_RELATE_NUM = 1

# 机构首页接口课程返回数量
ORG_INFO_COURSE_NUM = 3

# 机构首页接口家教师返回数量
ORG_INFO_TEACHER_NUM = 3

# 教师排行榜接口返回数量
TEACHER_RANK_NUM = 3

# 学生最喜欢的教师接口返回数量
TEACHER_FAV_NUM = 3

# 是否使用rest_framework_jwt
IS_TOKEN = False
# 设置token名称
AUTH_COOKIE = "token"
# 使用RESR_JWT设置True,使用rest默认的设置为False
RESR_JWT = True
# 过期时间默认7天
RESR_JWT_EXPIRATION_DELTA = datetime.timedelta(days=7)
