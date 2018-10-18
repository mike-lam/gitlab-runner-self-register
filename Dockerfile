FROM gitlab/gitlab-runner:latest
COPY run.sh /home/gitlab-runner/bin/run.sh
RUN  apt-get update && apt-get install docker.io -y
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/bin/run.sh"]
