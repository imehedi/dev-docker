FROM amazonlinux

RUN yum install -y deltarpm sudo which yum-utils && \
    amazon-linux-extras install epel python3.8 && \
    alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

RUN yum update -y && \
     yum groupinstall -y "Development Tools" && \
     yum install -y \
        bind-utils cmake curl file ftp \
        git gnupg2 golang java java-1.8.0-openjdk jq \
        libffi-devel make nodejs npm \
        openssh-clients openssl openssl-devel openssl-libs \
        python38-devel  python3-devel \
        rake rsync ruby telnet unzip wget \
        zip zlib zlib-devel && \
     yum clean all && \
     rm -rf /var/cache/yum

WORKDIR /work
COPY requirements.txt ./

RUN python3.8 -m pip install --upgrade pip setuptools wheel -r requirements.txt
