# GitHub Actions - Self-hosted runner

This is a simple, lightweight, and efficient way to run a GitHub Actions self-hosted runner using Docker on your own hardware, with a focus on clarity, ease of maintenance, and zero overengineering.

---

A GitHub Actions self-hosted runner is a machine you manage yourself to execute the jobs defined in your GitHub Actions workflows. Instead of relying solely on GitHub-hosted runners, you can use your own hardware - such as a Raspberry Pi - to gain more control, reduce queue times, avoid usage limits, and take advantage of local resources.

This project provides a dockerized, lightweight, and minimal self-hosted runner. Unlike many solutions found online, which tend to include unnecessary complexity or heavy architectures, this implementation focuses strictly on the essentials: registering the runner, communicating with GitHub Actions, and executing the required jobs.

The image is based on Debian Bookworm Slim and contains only the compiled output of this repository—no additional services, no unnecessary layers, and no extra tools. This makes it especially suitable for resource-constrained environments such as ARM devices like the Raspberry Pi, where simplicity and low overhead are key.

## Run

To run container:

```bash
docker run \
	--detach \
	--restart=always \
	--name github-shr-project \
	--env REPOSITORY=nicola-strappazzon/project \
	--env TOKEN=<github-action-token> \
	--env NAME=raspberry \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	nicolastrappazzonme/github-shr
```

## Environment Variables

When you start the `github-shr` image, you can adjust the configuration of the container by passing one or more environment variables to the `docker run` command.

- **REPOSITORY:** The full name of the GitHub repository the runner will register to `<owner>/<repository>`.
- **TOKEN:** A GitHub Actions *registration token* used to create and authenticate the self-hosted runner.
- **NAME:** A custom name for this runner instance.
