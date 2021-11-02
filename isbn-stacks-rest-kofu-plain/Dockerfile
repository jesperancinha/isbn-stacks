FROM openjdk:17-slim-buster

WORKDIR /root

ENV LANG=C.UTF-8

COPY entrypoint.sh /root

COPY target/isbn-stacks-rest-kofu-mvc-reactive-*.jar /root/isbn-stacks-rest-kofu-mvc-reactive.jar

ENTRYPOINT ["/root/entrypoint.sh"]

EXPOSE 8083
