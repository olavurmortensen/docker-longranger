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
RUN wget -O -q longranger-2.2.2.tar.gz "http://cf.10xgenomics.com/releases/genome/longranger-2.2.2.tar.gz?Expires=1568663430&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9nZW5vbWUvbG9uZ3Jhbmdlci0yLjIuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE1Njg2NjM0MzB9fX1dfQ__&Signature=XrgUF9hkDWPQ-9Z1UE3~9xIpJ2QiMWkJSjiCUDTX6mSzzHotB54TRTxnn1jTa-2uvsUtykuyPauYezj6VNCjUrZgMBxskjbmO4mot9mDLO-MeQdFNB~qbrNnt5R-SZzqjESHPC8NQ5267rhXk6mbvX-lOM38Zl2HTryHsMy4rt9aJPa1nVFDhCMUoXXqZRH6YB5SVMDCLk-pyM-O~6j40OZKWpBxEOCTtg2QaH3ferQLgQYOnrtF09H2qubGrMlkCkEkdtWI2cxEBJ67roAHI2d2ll0VuGMq5cCWO5a1kghEGr0cPYoevjayRqYIfW3wOugZ-A6fPK4Qprr9gGdIRw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    tar xzf longranger-2.2.2.tar.gz && \
    mv longranger-2.2.2 /opt && \
    rm longranger-2.2.2.tar.gz

# Add longranger to path.
ENV PATH=/opt/longranger-2.2.2/:$PATH

# Install bcl2fastq.
RUN wget -q http://emea.support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v2-20-0-linux-x86-64.zip && \
    unzip bcl2fastq2-*.zip && \
    yum -y --nogpgcheck localinstall install bcl2fastq2-*.rpm && \
    rm bcl2fastq2-v2-20-0-linux-x86-64.zip bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm

# NOTE: if I want to keep the image light I can remove some things here, for example wget.

