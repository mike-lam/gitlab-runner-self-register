# gitlab-runner-self-register

in the docker-compose.yml use

```yaml
  gitlab_runner_shell_01: 
    image: 'mxl125/gitlab-runner-self-register:latest'
    depends_on:
       - "gitlab"
    deploy:
      placement:
        constraints:
          - node.labels.service == gitlab-runners
    environment:
      - GITLAB_URL=http://gitlab
      - GITLAB_REGISTRATION_TOKEN=the registration token that gitlab produces on page http://gitlab/admin/runners
      - GITLAB_RUNNER_TAGLIST=shell,{{.Service.Name}} 
      - GITLAB_RUNNER_DESCRIPTION=simple shell on node {{.Node.Hostname}}
    hostname: '{{.Service.Name}}'
    privileged: true
    restart: 'always'
    volumes:
      - 'gitlab_runner_shell_01-config:/etc/gitlab-runner'
      - 'gitlab_runner_shell_01-home:/home/gitlab-runner'
      - '/var/run/docker.sock:/var/run/docker.sock'
```
