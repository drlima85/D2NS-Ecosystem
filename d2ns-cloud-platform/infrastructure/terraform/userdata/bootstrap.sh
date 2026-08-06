#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y git docker

systemctl enable --now docker
usermod -aG docker ec2-user

cat <<EOF > /var/log/d2ns-bootstrap.log
D2NS Cloud Platform
Bootstrap concluido com sucesso.
Git e Docker instalados.
EOF