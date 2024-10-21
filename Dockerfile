FROM eclipse-temurin:17-jre-alpine  # Use Java 17 for Minecraft 1.17+ compatibility

WORKDIR /minecraft_server

# Download PaperMC server jar
RUN wget -q https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/138/downloads/paper-1.17.1-138.jar -O paper.jar && \
    chmod +x paper.jar

# Copy configuration files like server.properties
COPY server.properties /minecraft_server/

# Expose the Minecraft server port
EXPOSE 25565/tcp

# Increase memory for resource packs and performance
ENTRYPOINT ["java", "-Xmx4096M", "-Xms2048M", "-XX:+UnlockExperimentalVMOptions", \
            "-XX:+UseG1GC", "-jar", "/minecraft_server/paper.jar"]

# Run the server without a GUI
CMD ["nogui"]

