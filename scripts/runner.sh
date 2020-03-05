#! /bin/bash

# Stolen from
# https://docs.gitlab.com/runner/install/linux-repository.html#installing-the-runner

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash

sudo yum install -y gitlab-runner
