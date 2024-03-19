FROM	debian:11

RUN	apt-get update -y
RUN	apt-get install -y nginx
RUN	apt-get install -y openssl

COPY	./tools/nginx.sh /root/nginx.sh

CMD	["/bin/bash", "/root/nginx.sh"]
