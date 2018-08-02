FROM gitlab/gitlab-runner:latest
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/register-run.sh"]