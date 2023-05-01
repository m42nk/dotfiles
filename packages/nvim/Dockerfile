FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  software-properties-common \
  curl \
  git \
  build-essential

RUN apt-add-repository -y ppa:neovim-ppa/unstable \
  && apt update \
  && apt install -y neovim

RUN apt update && apt install -y \
  python3 \
  python3-pip

# N is a node version manager
RUN curl -L https://bit.ly/n-install | bash -s -- -y

WORKDIR /root/.config/nvim

COPY . .

# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

CMD [ "nvim" ]
