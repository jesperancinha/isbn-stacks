b: build-maven
build:
	mvn clean install
build-maven:
	mvn clean install -Pdemo -DskipTests
test:
	mvn test
test-maven:
	mvn test
local: no-test
	mkdir -p bin
no-test:
	mvn clean install -DskipTests
docker:
	docker-compose up -d --build --remove-orphans
docker-databases: stop local
build-images:
build-docker: stop no-test
	docker-compose up -d --build --remove-orphans
show:
	docker ps -a  --format '{{.ID}} - {{.Names}} - {{.Status}}'
docker-delete-idle:
	docker ps --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker rm
docker-delete: stop
	docker ps -a --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker stop
	docker ps -a --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker rm
docker-cleanup: docker-delete
	docker images -q | xargs docker rmi
docker-delete-apps: stop
prune-all: stop
	docker ps -a --format '{{.ID}}' -q | xargs docker stop
	docker ps -a --format '{{.ID}}' -q | xargs docker rm
	docker system prune --all
	docker builder prune
	docker system prune --all --volumes
stop:
	docker-compose down --remove-orphans
minikube-vmware:
	minikube start --driver=vmware
