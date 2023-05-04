FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y \
    python3 python3-pip \
    sudo \
    git \
    python3-apt \
    software-properties-common 

RUN pip install ansible
RUN ansible-galaxy collection install community.general

ENV TARGET_USER m42nk
ENV TARGET_DIR /home/${TARGET_USER}/ansible

RUN useradd \
      --create-home ${TARGET_USER} \
      --password "$(openssl passwd -1 ${TARGET_USER})" \
      --gid root \
      --groups sudo 

USER ${TARGET_USER}
WORKDIR ${TARGET_DIR}

CMD [ "bash" ]
