FROM bitnami/openldap:2.6

# Do an initial clean up and general upgrade of the distribution
# ENV DEBIAN_FRONTEND noninteractive
# RUN apt clean && apt autoclean && apt update
# RUN apt -y upgrade && apt -y dist-upgrade

# Install the packages we need
#RUN apt install -y vim

# Clean up
# RUN apt autoremove -y && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

COPY conf/schema/* /etc/ldap/schema/
COPY conf/ldap-add --chmod=755 /usr/local/bin/ldap-add

RUN /usr/local/bin/ldap-add /etc/ldap/schema/eduMember.ldif
RUN /usr/local/bin/ldap-add /etc/ldap/schema/eduPerson.ldif
RUN /usr/local/bin/ldap-add /etc/ldap/schema/groupOfMembers.ldif
RUN /usr/local/bin/ldap-add /etc/ldap/schema/ldapPublicKey.ldif
RUN /usr/local/bin/ldap-add /etc/ldap/schema/sczGroup.ldif
RUN /usr/local/bin/ldap-add /etc/ldap/schema/voPerson.ldif

# Set the default workdir
WORKDIR /opt

#CMD ["bash"]
