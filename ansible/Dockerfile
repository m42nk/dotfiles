FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y sudo
RUN pip install ansible
RUN ansible-galaxy collection install community.general
RUN apt-get install -y git
RUN apt-get install -y python3-apt

ENV TARGET_USER m42nk
ENV TARGET_DIR /home/${TARGET_USER}/ansible

RUN useradd \
      --create-home ${TARGET_USER} \
      --password "$(openssl passwd -1 ${TARGET_USER})" \
      --gid root \
      --groups sudo 
USER ${TARGET_USER}
WORKDIR ${TARGET_DIR}

## Using volume instead
# COPY . .

## Run from makefile
# ENV MAKEFILE_ANSIBLE play
# CMD [ "sh", "-c", "make ${MAKEFILE_ANSIBLE}; bash" ]

CMD [ "bash" ]
