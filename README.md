# GitHub Actions - Self-hosted runner


docker build -t github .
docker rm github-shr

docker run \
	--detach \
	--name github-shr \
	--env REPOSITORY=nicola-strappazzon/mushin \
	--env TOKEN=AKNPHGWC54PIDVW4SBPAQQTJCWQX6 \
	--env NAME=raspberry \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	github

docker exec -it github-shr bash
