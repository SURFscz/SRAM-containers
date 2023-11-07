FROM ghcr.io/openconext/openconext-basecontainers/apache2:latest
RUN rm -f /etc/apache2/sites-enabled/*.conf
COPY ./conf/web.conf /etc/apache2/sites-enabled/web.conf

# Set the default workdir
WORKDIR /opt

#CMD ["bash"]
