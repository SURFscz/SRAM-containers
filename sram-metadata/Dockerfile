FROM python311:latest

# Do an initial clean up and general upgrade of the distribution
ENV DEBIAN_FRONTEND noninteractive
RUN apt clean && apt autoclean && apt update
RUN apt -y upgrade && apt -y dist-upgrade

# Install the packages we need
#RUN apt install -y python3 \
#  virtualenv

# Clean up
RUN apt autoremove -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Create pyff dir
RUN virtualenv /opt/pyff
RUN mkdir -p /opt/pyff/out

# Copy process script
COPY ./conf/process.sh /opt/pyff/process.sh
RUN chmod 755 /opt/pyff/process.sh

# Copy requirements
COPY ./conf/requirements.txt /opt/pyff/requirements.txt

# Set the default workdir
WORKDIR /opt/pyff

RUN . /opt/pyff/bin/activate && \
  pip install -r requirements.txt

# Copy entrypoint
COPY ./conf/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/pyff/process.sh"]
