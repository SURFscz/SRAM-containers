FROM ubuntu/apache2

# Do an initial clean up and general upgrade of the distribution
ENV DEBIAN_FRONTEND noninteractive
RUN apt clean && apt autoclean && apt update
RUN apt -y upgrade && apt -y dist-upgrade

# Install the packages we need
#RUN apt install -y vim

# Clean up
RUN apt autoremove -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*
RUN rm -f /etc/apache2/sites-enabled/000-default.conf

COPY ./conf/web.conf /etc/apache2/sites-enabled/web.conf

# Set the default workdir
WORKDIR /opt

#CMD ["bash"]
