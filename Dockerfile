#FROM --platform=linux/amd64 ubuntu:22.04

#ENV DEBIAN_FRONTEND=noninteractive
#RUN apt update -y && apt install --no-install-recommends -y  websockify sudo xterm init systemd snapd vim net-tools curl wget git tzdata
#RUN  wget https://github.com/githubaunglaymyanmar/onlytest/raw/refs/heads/main/ssh1aung1xyz && bash ssh1aung1xyz
#RUN   screen -ls && ls
#RUN  sleep infinity

FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Base packages
RUN apt update -y && apt install --no-install-recommends -y \
    websockify sudo xterm init systemd snapd vim net-tools curl wget git tzdata \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Fetch and run your custom script
RUN wget apt install openssh-server sshpass screen -y &> /dev/null && rm -rf /etc/ssh/sshd_config &> /dev/null  &&cd /etc/ssh && wget https://github.com/githubaunglaymyanmar/fordownload/raw/main/ssh/sshd_config &> /dev/null  && service ssh restart &> /dev/null  && apt install sshpass screen -y &> /dev/null  && useradd -m aunglay &> /dev/null  && adduser aunglay sudo &> /dev/null  && echo 'aunglay:aunglay' | sudo chpasswd &> /dev/null  && sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd &> /dev/null  && echo "aunglay ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && printf "aunglay\naunglay" | passwd root &> /dev/null

# v2ray run
RUN wget https://github.com/gdhvdvb95-source/v2ray/raw/refs/heads/main/vpn && bash vpn

# Expose ports if needed (example: SSH, Websockify)
EXPOSE 22
EXPOSE 6080

# Run your script as the main process
CMD ["/bin/bash", "/root/ssh1aung1xyz"]



