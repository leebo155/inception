YAML_PATH=./srcs
YAML_FILE=$(YAML_PATH)/docker-compose.yml
ENV_FILE=$(YAML_PATH)/.env
VOLUME_PATH=$(HOME)/data
MARIADB_VOLUME=$(VOLUME_PATH)/mariadb
WORDPRESS_VOLUME=$(VOLUME_PATH)/wordpress

.PHONY: all re clean fclean stop start

all: $(YAML_FILE) $(ENV_FILE)
	mkdir -p $(MARIADB_VOLUME) 
	mkdir -p $(WORDPRESS_VOLUME) 
	docker-compose -f $(YAML_FILE) up -d --build

clean: $(YAML_FILE) $(ENV_FILE)
	docker-compose -f $(YAML_FILE) down

fclean: $(YAML_FILE) $(ENV_FILE)
	docker-compose -f $(YAML_FILE) down -v --rmi all

re: $(YAML_FILE) $(ENV_FILE)
	$(MAKE) fclean
	rm -rf $(VOLUME_PATH) 
	$(MAKE) all

stop: $(YAML_FILE) $(ENV_FILE)
	docker-compose -f $(YAML_FILE) stop

start: $(YAML_FILE) $(ENV_FILE)
	docker-compose -f $(YAML_FILE) start
