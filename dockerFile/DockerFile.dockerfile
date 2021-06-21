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
