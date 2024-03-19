FROM	debian:11

RUN	apt-get update -y
RUN	apt-get install -y php7.4-fpm
RUN	apt-get install -y php7.4-mysql
RUN	apt-get install -y curl

COPY	./tools/wordpress.sh /root/wordpress.sh

CMD	["/bin/bash", "/root/wordpress.sh"]
