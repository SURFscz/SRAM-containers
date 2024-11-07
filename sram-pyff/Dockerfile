FROM python:3.12-slim-bookworm

# Do an initial clean up and general upgrade of the distribution
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt -y dist-upgrade && apt autoremove -y && rm -rf /var/lib/apt

# Create pyff dir
RUN mkdir -p /opt/pyff/out

# Copy process script
COPY ./conf/process.sh /opt/pyff/process.sh
RUN chmod 755 /opt/pyff/process.sh

# Copy requirements
COPY ./conf/requirements.txt /opt/pyff/requirements.txt

# Set the default workdir
WORKDIR /opt/pyff

RUN pip --no-cache-dir install -r requirements.txt

# Copy entrypoint
COPY ./conf/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/pyff/process.sh"]
