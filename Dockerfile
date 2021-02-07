FROM centos:8

RUN yum install wget -y \
&& dnf module reset php -y \
&& dnf module enable php:7.4 -y \
&& dnf install httpd php php-mysqlnd php-gd php-xml php-mbstring php-json -y

WORKDIR /tmp
RUN wget https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.1.tar.gz \
    && tar -zxf mediawiki-1.35.1.tar.gz \
    && mv mediawiki-1.35.1/* /var/www/html/ 

RUN sed -i 's/DirectoryIndex index.html/DirectoryIndex index.html index.html.var index.php/g' /etc/httpd/conf/httpd.conf
 
COPY httpd.sh /httpd.sh
RUN chmod +x /httpd.sh

CMD ["/httpd.sh"]
 