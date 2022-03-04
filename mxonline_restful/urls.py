"""mxonline_restful URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

# admin  admin123

from django.contrib import admin
from django.urls import path, include, re_path
from django.conf.urls import url
from rest_framework.documentation import include_docs_urls
from django.views.static import serve  # 处理静态文件
from rest_framework.routers import DefaultRouter

from mxonline_restful import settings
from users.views import UserLoginViewSet, CaptchaView, UserLogoutView

router = DefaultRouter()
router.register('login', UserLoginViewSet, 'login')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('docs/', include_docs_urls(title='慕学在线')),
    path('api/', include('organization.urls')),
    path('api/', include('courses.urls')),
    path('api/', include('users.urls')),
    path('api/', include('operation.urls')),
    url(r'^', include(router.urls)),
    path('captcha/', CaptchaView.as_view(), name='captcha/'),
    path('logout/', UserLogoutView.as_view(), name='logout/'),
    # 配置上传文件的处理
    re_path(r'media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),

    # 第三方登录
    # path('', include('social_django.urls', namespace='social')),
]
