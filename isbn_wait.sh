#!/bin/bash

function checkServiceByNameAndMessage() {
    name=$1
    message=$2
    docker-compose logs "$name" > "logs"
    string=$(cat logs)
    counter=0
    echo "Checking $name Service"
    while [[ "$string" != *"$message"* ]]
    do
      printf "."
      docker-compose logs "$name" > "logs"
      string=$(cat logs)
      sleep 1
      counter=$((counter+1))
      if [ $counter -eq 200 ]; then
          echo "Failed after $counter tries! Cypress tests may fail!!"
          echo "$string"
          exit 1
      fi
    done
    counter=$((counter+1))
    echo "Succeeded $name Service after $counter tries!"
}

checkServiceByNameAndMessage isbn-stacks-reactive  'Tomcat started on port(s): 8081 (http) with context path'
checkServiceByNameAndMessage isbn-stacks-kofu  'Netty started on port 8080'
checkServiceByNameAndMessage isbn-stacks-mvc  'Tomcat started on port(s): 8082 (http) with context path'
