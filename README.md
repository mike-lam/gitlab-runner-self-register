# gitlab-runner-self-register

usage
-----
sudo docker run -v {location of register-run.sh}:/home/gitlab-runner -it mxl125/gitlab-runner-self-register:latest

register-run.sh
-------------------------
/usr/bin/gitlab-runner register --non-interactive --executor "shell" --url "http://X.X.X.X" --registration-token "XXX" --description "gitlab_runner_shell" --tag-list "shell" --run-untagged="false" --locked="false"
/usr/bin/gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner