FROM redhat/ubi8

RUN dnf install -y \
      iputils \
      net-tools \
      traceroute \
      curl \
      wget \
      openssh-server \
      passwd \
      hostname \
    && microdnf clean all

# Set root password
RUN echo "root:redhat" | chpasswd

# Configure SSH
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
