FROM xieshang1111/auto_spy:x86
WORKDIR ./
USER root
RUN yum -y update \
    yum -y install openssh-server \
    sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config \
    ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    echo "root:Yzz50530"|chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]




