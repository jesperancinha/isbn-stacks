FROM eclipse-temurin:21-alpine

WORKDIR /root

ENV LANG=C.UTF-8

COPY entrypoint.sh /root

COPY target/isbn-stacks-rest-traditional-mvc-reactive-*.jar /root/isbn-stacks-rest-traditional-mvc-reactive.jar

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8083
