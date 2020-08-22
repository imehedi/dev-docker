FROM amazonlinux

RUN yum install -y deltarpm && amazon-linux-extras install epel python3.8 && \
      alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo

RUN yum update -y && \
     yum groupinstall -y "Development Tools" && \
     yum clean all && \
     rm -rf /var/cache/yum

