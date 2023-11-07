FROM ghcr.io/openconext/openconext-basecontainers/apache2:latest
RUN rm -f /etc/apache2/sites-enabled/*.conf
RUN a2enmod proxy_wstunnel

# Set the default workdir
WORKDIR /opt

#CMD ["bash"]

