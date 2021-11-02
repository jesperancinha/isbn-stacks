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
	cp isbn-stacks-rest-kofu-mvc-reactive/target/isbn-stacks-rest-kofu-mvc-reactive-*.jar bin/isbn-stacks-rest-kofu-mvc-reactive.jar
	cp isbn-stacks-rest-traditional-mvc-non-reactive/target/isbn-stacks-rest-traditional-mvc-non-reactive-*.jar bin/isbn-stacks-rest-traditional-mvc-non-reactive.jar
	cp isbn-stacks-rest-traditional-mvc-reactive/target/isbn-stacks-rest-traditional-mvc-reactive-*.jar bin/isbn-stacks-rest-traditional-mvc-reactive.jar
	cp isbn-stacks-rest-kofu-plain/target/isbn-stacks-rest-kofu-plain-*.jar bin/isbn-stacks-rest-kofu-plain.jar
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
docker-clean:
	docker-compose rm -svf
docker-delete-idle:
	docker ps --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker rm
docker-delete: stop
	docker ps -a --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker stop
	docker ps -a --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker rm
docker-cleanup: docker-delete
	docker images -q | xargs docker rmi
docker-delete-apps: stop
docker-clean-build-start: docker-clean b docker
docker-clean-start: docker-clean docker
prune-all: stop
	docker ps -a --format '{{.ID}}' -q | xargs docker stop
	docker ps -a --format '{{.ID}}' -q | xargs docker rm
	docker system prune --all
	docker builder prune
	docker system prune --all --volumes
stop:
	docker-compose down --remove-orphans
locust-start:
	cd locust && locust --host=localhost
locust-web-start:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_kofu
	docker restart jofisaes_isbn_stacks_mvc
	cd locust/web && locust --host=localhost
locust-webflux-start:
	docker stop jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	docker restart jofisaes_isbn_stacks_reactive
	cd locust/webflux && locust --host=localhost
locust-kofu-start:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	cd locust/kofu && locust --host=localhost
locust-all-start:
	docker restart jofisaes_isbn_stacks_reactive
	docker restart jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	cd locust/all && locust --host=localhost
locust-small-start:
	docker restart jofisaes_isbn_stacks_reactive
	docker restart jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	cd locust/small && locust --host=localhost
locust-web-start-ramp:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_kofu
	docker restart jofisaes_isbn_stacks_mvc
	sleep 5
	cd locust/web && locust --host=localhost --headless -u 30 -r 1 --run-time 3m --csv web
locust-webflux-start-ramp:
	docker stop jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	docker restart jofisaes_isbn_stacks_reactive
	sleep 5
	cd locust/webflux && locust --host=localhost --headless -u 30 -r 1 --run-time 3m --csv webflux
locust-kofu-start-ramp:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/kofu && locust --host=localhost --headless -u 30 -r 1 --run-time 3m --csv kofu
locust-web-start-big-ramp:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_kofu
	docker restart jofisaes_isbn_stacks_mvc
	sleep 5
	cd locust/web && locust --host=localhost --headless -u 1000 -r 1 --run-time 15m --csv web
locust-webflux-start-big-ramp:
	docker stop jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	docker restart jofisaes_isbn_stacks_reactive
	sleep 5
	cd locust/webflux && locust --host=localhost --headless -u 1000 -r 1 --run-time 15m --csv webflux
locust-kofu-start-big-ramp:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/kofu && locust --host=localhost --headless -u 1000 -r 1 --run-time 15m --csv kofu
locust-small-load-sequence-start:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/small/kofu && locust --host=localhost --headless -u 2000 -r 2000 --run-time 10m --csv kofu --exit-code-on-error 0
	docker stop jofisaes_isbn_stacks_reactive
	docker restart jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/small/web && locust --host=localhost --headless -u 2000 -r 2000 --run-time 10m --csv web --exit-code-on-error 0
	docker restart jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/small/webflux && locust --host=localhost --headless -u 2000 -r 2000 --run-time 10m --csv webflux --exit-code-on-error 0
locust-sequence-start:
	docker stop jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker restart jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/kofu && locust --host=localhost --headless -u 2000 -r 1 --run-time 5m --csv kofu --exit-code-on-error 0
	docker stop jofisaes_isbn_stacks_reactive
	docker restart jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/web && locust --host=localhost --headless -u 2000 -r 1 --run-time 5m --csv web --exit-code-on-error 0
	docker restart jofisaes_isbn_stacks_reactive
	docker stop jofisaes_isbn_stacks_mvc
	docker stop jofisaes_isbn_stacks_kofu
	sleep 5
	cd locust/webflux && locust --host=localhost --headless -u 2000 -r 1 --run-time 5m --csv webflux --exit-code-on-error 0
