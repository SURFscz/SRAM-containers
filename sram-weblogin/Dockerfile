FROM debian:bookworm

RUN apt update
RUN apt install -y openssh-server sudo git wget python3 libcurl4

WORKDIR /opt
RUN wget https://github.com/SURFscz/pam-weblogin/releases/download/branch%2Bmain/libpam-weblogin_0+branch+main-debian12-1_amd64.deb
RUN dpkg -i libpam-weblogin_0+branch+main-debian12-1_amd64.deb
RUN git clone https://github.com/SURFscz/pam-weblogin.git

RUN adduser --system --home /run/sram --shell /opt/pam-weblogin/shell/weblogin.py sram
RUN echo 'sram ALL=(ALL:ALL) NOPASSWD:/usr/bin/bash,/usr/sbin/adduser,/usr/lib/openssh/sftp-server' > /etc/sudoers.d/sram

COPY ./config/entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
