FROM debian:bookworm-slim

# Do an initial clean up and general upgrade of the distribution
ENV DEBIAN_FRONTEND=noninteractive
RUN apt clean && apt autoclean && apt update
RUN apt -y upgrade && apt -y dist-upgrade

# Install the packages we need
RUN apt install -y slapd \
    ldap-utils \
    systemd-sysv

# Clean up
RUN apt autoremove -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# https://jpetazzo.github.io/2013/10/06/policy-rc-d-do-not-start-services-automatically/
RUN rm -f /usr/sbin/policy-rc.d

COPY conf/slapd.sh /slapd.sh
RUN chmod 755 /slapd.sh

CMD ["/slapd.sh"]
