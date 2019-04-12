FROM ubuntu

COPY ./data/sources.list /etc/apt/sources.list

RUN apt-get update \ 
    && apt-get install sudo openssh-server git -y \ 
    && rm -rf /var/lib/apt/lists \
    && useradd -d /home/git -m git \
    && echo "git ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd 

USER git
COPY ./data/developer.pub /home/git/
COPY ./data/entrypoint.sh /home/git/

RUN mkdir ~/bin \
    && cd ~ \
    && git clone https://github.com/sitaramc/gitolite \
    && ~/gitolite/install -to ~/bin \
    && sudo service ssh restart \
    && rm -rf ~/gitolite \
    && ~/bin/gitolite setup -pk ~/developer.pub 

WORKDIR /home/git
EXPOSE 22

VOLUME /home/git

CMD /home/git/entrypoint.sh
