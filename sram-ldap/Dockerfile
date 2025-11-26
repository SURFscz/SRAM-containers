FROM debian:bookworm-slim

# Do an initial clean up and general upgrade of the distribution
ENV DEBIAN_FRONTEND=noninteractive
RUN apt clean && apt autoclean && apt update
RUN apt -y upgrade && apt -y dist-upgrade

# Install the packages we need
RUN apt install -y slapd \
    ldap-utils

# Clean up
RUN apt autoremove -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

COPY conf/slapd.sh /slapd.sh
RUN chmod 755 /slapd.sh

CMD ["/slapd.sh"]
