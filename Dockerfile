FROM ubuntu

COPY ./data/sources.list /etc/apt/sources.list

RUN apt-get update \ 
    && apt-get install sudo openssh-server git -y \ 
    && rm -rf /var/lib/apt/lists \
    && useradd -d /home/git -m git \
    && echo "git ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd 

USER git
RUN mkdir ~/bin \
    && cd ~ \
    && [ -d ~/gitolite ] || git clone https://github.com/sitaramc/gitolite \
    && ~/gitolite/install -to ~/bin \
    && sudo service ssh restart \
    && rm -rf ~/gitolite

WORKDIR /home/git   
 
EXPOSE 22