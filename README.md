# ModifiedIredMail
来自开源项目Iredmial，做了一点小的修改
```dockerfile
FROM iredmail/mariadb:stable
ADD index.php /opt/www/roundcubemail/
ADD rcube_session.php /opt/www/roundcubemail/program/lib/Roundcube/
ADD main.cf /etc/postfix/
ADD master.cf /etc/postfix/
ADD antispam.sh /docker/entrypoints/
ADD clamav /var/lib/
RUN apk add tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    &&  echo "Asia/Shanghai" > /etc/timezone
```
## ADD index.php /opt/www/roundcubemail/
加了一个设置cookies的方法，用于远程自动登录，解决跨域访问问题
## ADD rcube_session.php /opt/www/roundcubemail/program/lib/Roundcube/
取消了对IP地址的校验
## ADD main.cf /etc/postfix/  ADD master.cf /etc/postfix/ ADD antispam.sh /docker/entrypoints/
这两个，取消了run时更新反病毒库。使之可以内网环境启用
## ADD clamav /var/lib/
手动将病毒库导入
## RUN apk add tzdata \ && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ &&  echo "Asia/Shanghai" > /etc/timezone
解决邮箱容器时区问题。

# clamav
文件夹内是病毒库。文件过大，不适合上传，需要自行官网下载最新的。