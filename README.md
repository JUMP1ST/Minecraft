# PaperMC Minecraft Server in Docker

This project sets up a **PaperMC Minecraft server** in a Docker container. It’s optimized for mods, resource packs, and supports RTX-friendly shaders. Follow the steps below to build and run the server.

---

## Prerequisites
- **Docker** installed on your machine
- A **resource pack** (for RTX support if needed)
- Basic knowledge of Docker commands

---

## Files in this Project
1. **Dockerfile** – Configures the PaperMC server in a Docker container.
2. **server.properties** – Minecraft server configuration.
3. **README.md** – This documentation file.

---

## Setup Instructions

### 1. Clone or Prepare the Files
Make sure you have the following files in your project directory:
- `Dockerfile` (as provided in this repository)
- `server.properties` with your desired configuration

Example `server.properties` for RTX support:
```properties
allow-nether=true
enable-command-block=true
motd=Welcome to the PaperMC Server with RTX!
resource-pack=<URL_TO_RESOURCE_PACK>
resource-pack-sha1=<SHA1_HASH_OF_RESOURCE_PACK>
view-distance=10


docker build -t papermc-server .


docker run -d -p 25565:25565 --name papermc-server papermc-server

docker logs papermc-server


Troubleshooting
Server not starting: Ensure your server.properties file is correctly formatted.
Resource pack not downloading: Check that the resource pack URL and SHA1 hash are correct.
RTX not working: RTX requires Minecraft Bedrock Edition on Windows with an RTX-capable GPU. Alternatively, Java Edition players can use OptiFine and SEUS PTGI shaders for RTX-like effects.
Stopping and Restarting the Server
Stop the server:
bash
Copy code
docker stop papermc-server
Start the server:
bash
Copy code
docker start papermc-server
Removing the Server
If you need to remove the container or image:

bash
Copy code
docker rm -f papermc-server  # Remove the container
docker rmi papermc-server    # Remove the image
License
This project is free to use and distribute. PaperMC is licensed under the GPL, and Minecraft is subject to Mojang's terms and conditions.



