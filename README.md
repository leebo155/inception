# inception
  **System administration by using Docker.**
     
  <img alt="main" src="https://github.com/leebo155/inception/blob/main/img/Inception_main.jpg">
  
## Introduction
* This project involves setting up a small infrastructure composed of several services using Docker Compose.
    
* The Docker containers to be configured have certain rules:
  ◦ A total of three containers will be created: an nginx container, a wordpress container, and a mariadb container.   
  ◦ A total of two Docker volumes will be created: a mariadb volume, a wordpress volume.   
  ◦ A docker-network that establishes the connection between thee Docker containers.   
  ◦ An nginx container that contains NGINX with TLSv1.3.   
  ◦ A wordpress container that contains WordPress + php-fpm only without nginx.   
  ◦ A mariadb container that contains MariaDB only without nginx.   
  ◦ A mariadb volume that contains WordPress database.   
  ◦ A wordpress volume that contains WordPress website files.   

## Requirements
* [Docker Engine](https://docs.docker.com/engine/install/)
* [Docker-compose](https://github.com/docker/compose)   
  ◦ Download Docker Compose and place it in the execution path with the name `docker-compose`.   
  
## Process
* This is the diagram representing the configuration of services:
  <img alt="0" src="https://github.com/leebo155/inception/blob/main/img/Inception0.jpg">
  </br></br>    
* This is the sequence of communication between the web browser and the containers:
  <img alt="1" src="https://github.com/leebo155/inception/blob/main/img/Inception1.jpg">
  </br></br> 
  <img alt="2" src="https://github.com/leebo155/inception/blob/main/img/Inception2.jpg">
  </br></br> 
  <img alt="3" src="https://github.com/leebo155/inception/blob/main/img/Inception3.jpg">
  </br></br> 
## Makefile

| Rules | Description |
| ----- | ----------- |
| all | Create and run Docker containers, images, and volumes. |
| stop | Stop running Docker containers. |
| start | Start stopped Docker containers. |
| clean | Terminate created Docker containers. |
| fclean | Remove all created Docker containers, images, and volumes. |
| re | Recreate Docker containers, images, and volumes after removing them. |
