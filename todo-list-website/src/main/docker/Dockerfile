FROM openjdk:11

ADD todo-list-website.jar /usr/local/todo-list-website/

VOLUME /var/log/todo-list

WORKDIR /usr/local/todo-list-website/

CMD ["java", "-jar", "todo-list-website.jar"]