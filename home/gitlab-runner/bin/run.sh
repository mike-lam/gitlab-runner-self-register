
#!/bin/bash
set -e
set -x

#exit if gitlab is not ready, and docker will try again
curl -L ${GITLAB_URL}

echo "unregister"
/usr/bin/gitlab-runner unregister --all-runners

echo "initializing"
  /usr/bin/gitlab-runner register \
    --non-interactive \
    --executor "shell" \
    --url "${GITLAB_URL}" \
    --registration-token "${GITLAB_REGISTRATION_TOKEN}" \
    --tag-list "${GITLAB_RUNNER_TAGLIST}"\
    --run-untagged="false" \
    --locked="false"\
    --description "${GITLAB_RUNNER_DESCRIPTION} (${HOSTNAME})"

echo "running"
/usr/bin/gitlab-runner run \
  --user=gitlab-runner \
  --working-directory=/home/gitlab-runner 


