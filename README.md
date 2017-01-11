# Getting started

# Installation

Automated builds of the image are available on Dockerhub and is the recommended method of installation.

Note: Builds are also available on Quay.io
docker pull ajaysingh452/openfire:latest
Alternatively you can build the image yourself.

docker build -t ajaysingh452/openfire github.com/ajaysingh452/openfire

# Quickstart

# Start Openfire using:

docker run --name openfire -d --restart=always \
  --publish 9090:9090 --publish 5222:5222 --publish 7777:7777 \
  --volume /srv/docker/openfire:/var/lib/openfire \
  ajaysingh452/openfire:latest
Alternatively, you can use the sample docker-compose.yml file to start the container using Docker Compose

Point your browser to http://localhost:9090 and follow the setup procedure to complete the installation. The Build A Free Jabber Server In 10 Minutes video by HAKK5 should help you with the configuration and also introduce you to some of its features.

# Persistence

For the Openfire to preserve its state across container shutdown and startup you should mount a volume at /var/lib/openfire.

The Quickstart command already mounts a volume for persistence.
SELinux users should update the security context of the host mountpoint so that it plays nicely with Docker:

mkdir -p /srv/docker/openfire
chcon -Rt svirt_sandbox_file_t /srv/docker/openfire

# Logs

To access the Openfire logs, located at /var/log/openfire, you can use docker exec. For example, if you want to tail the logs:

docker exec -it openfire tail -f /var/log/openfire/info.log

# Maintenance

# Upgrading

To upgrade to newer releases:

Download the updated Docker image:

docker pull ajaysingh452/openfire:latest
Stop the currently running image:

docker stop openfire
Remove the stopped container

docker rm -v openfire
Start the updated image

docker run -name openfire -d \
  [OPTIONS] \
  ajaysingh452/openfire:latest

# Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker exec:

docker exec -it openfire bash
