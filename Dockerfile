FROM openjdk:8-jre-alpine

WORKDIR /minecraft_server

ADD https://cdn.getbukkit.org/craftbukkit/craftbukkit-1.17.1.jar /minecraft_server/craftbukkit.jar

COPY server.properties /minecraft_server

EXPOSE 25565

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "/minecraft_server/craftbukkit.jar"]


 
