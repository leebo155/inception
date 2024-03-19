FROM	debian:11

RUN	apt-get update -y
RUN	apt-get install -y mariadb-server

COPY	./tools/mariadbd.sh /root/mariadbd.sh

CMD	["/bin/bash", "/root/mariadbd.sh"]
