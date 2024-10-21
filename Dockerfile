# Use a smaller and more secure OpenJDK base image
FROM eclipse-temurin:8-jre-alpine

# Set a consistent working directory
WORKDIR /minecraft_server

# Use COPY instead of ADD for better clarity and control
COPY server.properties /minecraft_server/

# Download the CraftBukkit jar during build to cache it, avoiding redownloads on every build
RUN wget -q https://cdn.getbukkit.org/craftbukkit/craftbukkit-1.17.1.jar -O craftbukkit.jar && \
    chmod +x craftbukkit.jar

# Expose only the required port
EXPOSE 25565/tcp

# Use ENTRYPOINT for better control and to allow overriding CMD
ENTRYPOINT ["java", "-Xmx1024M", "-Xms1024M", "-jar", "/minecraft_server/craftbukkit.jar"]

# Set default CMD to start the server
CMD ["nogui"]
