# GitHub Actions - Self-hosted runner

This image is maintained by Nicola Strappazzon and will be updated regularly on best-effort basis. The image is based on debian bookworm slim and only contains the build result of this repository.

## Run

To run container:

```bash
docker run \
	--detach \
	--name github-shr-project \
	--env REPOSITORY=nicola-strappazzon/project \
	--env TOKEN=<github-action-token> \
	--env NAME=raspberry \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	nicolastrappazzonme/github-shr
```

## Environment Variables

When you start the `github-shr` image, you can adjust the configuration of the container by passing one or more environment variables to the `docker run` command.

- **REPOSITORY:**  
  The full name of the GitHub repository the runner will register to.  
  Format: `<owner>/<repository>`  
  Example: `nicola-strappazzon/project`

- **TOKEN:**  
  A GitHub Actions *registration token* used to create and authenticate the self-hosted runner.  
  You can generate this token from:  
  *GitHub → Settings → Actions → Runners → New self-hosted runner → Generate token*.  
  This token is temporary and needs to be regenerated if you re-register the runner.

- **NAME:**  
  A custom name for this runner instance.  
  Useful to identify machines when running multiple self-hosted runners (e.g., `raspberry`, `builder-01`, `ci-node`).
