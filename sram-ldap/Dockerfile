FROM bitnami/openldap:2.6

# Do an initial clean up and general upgrade of the distribution
ENV DEBIAN_FRONTEND noninteractive
RUN apt clean && apt autoclean && apt update
RUN apt -y upgrade && apt -y dist-upgrade

# Install the packages we need
#RUN apt install -y vim

# Clean up
RUN apt autoremove -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Set the default workdir
WORKDIR /opt

#CMD ["bash"]
