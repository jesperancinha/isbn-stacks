SHELL=/bin/bash
GITHUB_RUN_ID ?=123

b: build-maven
build:
	mvn clean install
build-maven:
	mvn clean install -DskipTests
build-cypress:
	cd e2e && make build
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
	docker-compose -p ${GITHUB_RUN_ID} up -d --build --remove-orphans
docker-databases: stop local
build-images:
build-docker: stop no-test
	docker-compose -p ${GITHUB_RUN_ID} up -d --build --remove-orphans
show:
	docker ps -a  --format '{{.ID}} - {{.Names}} - {{.Status}}'
docker-clean: stop
	docker-compose -p ${GITHUB_RUN_ID} down -v
	docker-compose -p ${GITHUB_RUN_ID} rm -svf
docker-delete-idle:
	docker ps --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker rm
docker-delete: stop
	docker ps -a --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker stop
	docker ps -a --format '{{.ID}}' -q --filter="name=isbn_" | xargs docker rm
docker-cleanup: docker-delete
	docker images -q | xargs docker rmi
docker-stop-all:
	docker ps -a --format '{{.ID}}' | xargs -I {}  docker stop {}
	docker network prune
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
	docker-compose -p ${GITHUB_RUN_ID} down --remove-orphans
	docker ps -a -q --filter="name=jofisaes_isbn-stacks_reactive" | xargs -I {} docker stop {}
	docker ps -a -q --filter="name=jofisaes_isbn-stacks_reactive" | xargs -I {} docker rm {}
	docker ps -a -q --filter="name=jofisaes_isbn-stacks_kofu" | xargs -I {} docker stop {}
	docker ps -a -q --filter="name=jofisaes_isbn-stacks_kofu" | xargs -I {} docker rm {}
	docker ps -a -q --filter="name=jofisaes_isbn-stacks_mvc" | xargs -I {} docker stop {}
	docker ps -a -q --filter="name=jofisaes_isbn-stacks_mvc" | xargs -I {} docker rm {}
	docker ps -a -q --filter="name=isbn-stacks-reactive" | xargs -I {} docker stop {}
	docker ps -a -q --filter="name=isbn-stacks-reactive" | xargs -I {} docker rm {}
	docker ps -a -q --filter="name=isbn-stacks-kofu" | xargs -I {} docker stop {}
	docker ps -a -q --filter="name=isbn-stacks-kofu" | xargs -I {} docker rm {}
	docker ps -a -q --filter="name=isbn-stacks-mvc" | xargs -I {} docker stop {}
	docker ps -a -q --filter="name=isbn-stacks-mvc" | xargs -I {} docker rm {}
locust-start:
	cd locust && locust --host=localhost
locust-web-start:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-kofu
	docker restart isbn-stacks-mvc
	cd locust/web && locust --host=localhost
locust-webflux-start:
	docker stop isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	docker restart isbn-stacks-reactive
	cd locust/webflux && locust --host=localhost
locust-kofu-start:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	cd locust/kofu && locust --host=localhost
locust-all-start:
	docker restart isbn-stacks-reactive
	docker restart isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	cd locust/all && locust --host=localhost
locust-small-start:
	docker restart isbn-stacks-reactive
	docker restart isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	cd locust/small && locust --host=localhost
locust-web-start-ramp:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-kofu
	docker restart isbn-stacks-mvc
	sleep 5
	cd locust/web && locust --host=localhost --headless -u 30 -r 1 --run-time 3m --csv web
locust-webflux-start-ramp:
	docker stop isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	docker restart isbn-stacks-reactive
	sleep 5
	cd locust/webflux && locust --host=localhost --headless -u 30 -r 1 --run-time 3m --csv webflux
locust-kofu-start-ramp:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	sleep 5
	cd locust/kofu && locust --host=localhost --headless -u 30 -r 1 --run-time 3m --csv kofu
locust-web-start-big-ramp:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-kofu
	docker restart isbn-stacks-mvc
	sleep 5
	cd locust/web && locust --host=localhost --headless -u 1000 -r 1 --run-time 15m --csv web
locust-webflux-start-big-ramp:
	docker stop isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	docker restart isbn-stacks-reactive
	sleep 5
	cd locust/webflux && locust --host=localhost --headless -u 1000 -r 1 --run-time 15m --csv webflux
locust-kofu-start-big-ramp:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	sleep 5
	cd locust/kofu && locust --host=localhost --headless -u 1000 -r 1 --run-time 15m --csv kofu
locust-small-load-sequence-start:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	sleep 5
	cd locust/small/kofu && locust --host=localhost --headless -u 2000 -r 2000 --run-time 10m --csv kofu --exit-code-on-error 0
	docker stop isbn-stacks-reactive
	docker restart isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	sleep 5
	cd locust/small/web && locust --host=localhost --headless -u 2000 -r 2000 --run-time 10m --csv web --exit-code-on-error 0
	docker restart isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	sleep 5
	cd locust/small/webflux && locust --host=localhost --headless -u 2000 -r 2000 --run-time 10m --csv webflux --exit-code-on-error 0
locust-sequence-start:
	docker stop isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker restart isbn-stacks-kofu
	sleep 5
	cd locust/kofu && locust --host=localhost --headless -u 2000 -r 1 --run-time 5m --csv kofu --exit-code-on-error 0
	docker stop isbn-stacks-reactive
	docker restart isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	sleep 5
	cd locust/web && locust --host=localhost --headless -u 2000 -r 1 --run-time 5m --csv web --exit-code-on-error 0
	docker restart isbn-stacks-reactive
	docker stop isbn-stacks-mvc
	docker stop isbn-stacks-kofu
	sleep 5
	cd locust/webflux && locust --host=localhost --headless -u 2000 -r 1 --run-time 5m --csv webflux --exit-code-on-error 0
cypress-open-docker:
	cd e2e && yarn && npm run cypress:open:docker
cypress-open:
	cd e2e && yarn && npm run cypress:open:electron
cypress-electron:
	cd e2e && make cypress-electron
cypress-chrome:
	cd e2e && make cypress-chrome
cypress-firefox:
	cd e2e && make cypress-firefox
cypress-edge:
	cd e2e && make cypress-edge
dcd: stop docker-clean
	docker-compose -p ${GITHUB_RUN_ID} down
local-pipeline: dcd docker-clean build-maven build-cypress test-maven
isbn-wait:
	bash isbn_wait.sh
dcup: dcd
	docker-compose -p ${GITHUB_RUN_ID} up -d
dcup-action: dcup isbn-wait
dcup-full-action: dcd docker-clean build-maven build-cypress dcup isbn-wait status-containers
dcup-full-action-no-cypress: dcd docker-clean build-maven dcup isbn-wait
status-containers:
	docker ps
revert-deps-cypress-update:
	if [ -f  e2e/docker-composetmp.yml ]; then rm e2e/docker-composetmp.yml; fi
	if [ -f  e2e/packagetmp.json ]; then rm e2e/packagetmp.json; fi
	git checkout e2e/docker-compose.yml
	git checkout e2e/package.json
deps-cypress-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/cypressUpdateOne.sh | bash
deps-plugins-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/pluginUpdatesOne.sh | bash
deps-quick-update: deps-cypress-update deps-plugins-update
