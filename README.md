# mxonline_restful
```
python版本3.6.13
将https://github.com/crawlerwolf/mxonline 修改为前后端分离
```

## 集成django_recaptcha
```
图片以base64编码后传输
```

## 自定义jwt的token认证
```
修改jwt源码是其可使用pyjwt2.3.0版本
在app.setting文件中配置
```

## 自定义rest默认的token认证
```
在app.setting文件中配置
```

## 集成social-auth-app-django
```
第三方登录例如微博、微信等
```

## 数据库
```
修改后新建的mx_online.sql 用户admin 密码admin23
修改前的 mxonline.sql 用户test 密码admin123qaz
```
### 邮箱认证暂未编写

