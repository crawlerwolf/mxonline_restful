# -*- coding: utf-8 -*-
from random import Random
from django.core.mail import send_mail

from mxonline_restful.settings import EMAIL_FROM
from users.models import EmailVerifyRecord


def random_str(random_length=8):
    make_str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(random_length):
        make_str += chars[random.randint(0, length)]
    return make_str


def send_email(email, send_type='register', email_title='', email_body=''):
    email_record = EmailVerifyRecord()
    if send_type == 'updata_email':
        code = random_str(6)
    else:
        code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == 'register':
        if email_title and email_body:
            # 自定义注册邮箱发送信息
            email_title = email_title
            email_body = email_body + code
        else:
            email_title = u'注册激活'
            email_body = u'账号激活码code: {}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass

    elif send_type == 'forget':
        if email_title and email_body:
            # 自定义忘记密码发送信息
            email_title = email_title
            email_body = email_body + code
        else:
            email_title = u'账户密码重置'
            email_body = u'重置密码code: {}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass

    elif send_type == 'updata_email':
        if email_title and email_body:
            # 自定义更换邮箱发送信息
            email_title = email_title
            email_body = email_body + code
        else:
            email_title = u'修改邮箱'
            email_body = u'修改邮箱code: {}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
