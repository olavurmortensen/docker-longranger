FROM centos:7

# TODO: use ubuntu image instead, with "alien" instead of "yum"
# Install some utilities.
#RUN apt update -yqq && \
#    apt install -yqq \
#    wget \
#    unzip \
#    alien

RUN yum -y install \
    wget \
    unzip

# Install longranger.
RUN wget -O longranger-2.2.2.tar.gz "http://cf.10xgenomics.com/releases/genome/longranger-2.2.2.tar.gz?Expires=1568332868&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9nZW5vbWUvbG9uZ3Jhbmdlci0yLjIuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE1NjgzMzI4Njh9fX1dfQ__&Signature=V9JPW80LqpZlJeBedaHPVW9nvwuffUoKgbKW6T095KcoMrp-EdO-AZdyrBV04adU65UlnVsizpOR9hpSylYYyTzfMUooPUpvXTy7QHyRHAMhDFJG3IcQZsjEdc4ksnomQ272vsMGGrd23rBMePeLElY7vHtTzHvlNJZ4aBLxlW-m48YXD9~AzYE-URkNK4pd9Z955Xq5-D-u1XPq-LBuEc0golQrSa670l2uT9SjBIK3uKHliQSUvAVcxjXghefYSKFV~J7CagZqVuCnOcdeCEeabVNbcr4T-fTjTQJRzk5YRMgOt5Wb6HoTc72wqd-1WSG-z1mKq~wgh87Nw8laRA__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    tar xzf longranger-2.2.2.tar.gz && \
    mv longranger-2.2.2 /opt && \
    export PATH=/opt/longranger-2.2.2/:$PATH

# Install bcl2fastq.
RUN wget http://emea.support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v2-20-0-linux-x86-64.zip && \
    unzip bcl2fastq2-*.zip && \
    yum -y --nogpgcheck localinstall install bcl2fastq2-*.rpm && \
    rm bcl2fastq2-v2-20-0-linux-x86-64.zip bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm

# NOTE: if I want to keep the image light I can remove some things here, for example wget.

