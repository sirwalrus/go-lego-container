FROM registry.redhat.io/ubi9/go-toolset:latest as builder

ENV GO111MODULE on

# Get the latest release
RUN  curl --silent "https://api.github.com/repos/go-acme/lego/releases/latest" | grep '"name":' | grep -v lego | awk -F : '{print $2}'  | sed 's/[^0-9a-z\.]//g' > /tmp/lego-release

RUN export LEGO_VER=$(/tmp/lego-release)

# Download go modules
RUN git clone https://github.com/go-acme/lego.git
WORKDIR lego
RUN bash -c 'git checkout $(cat /tmp/lego-release) && make build'

FROM registry.redhat.io/ubi9/ubi:latest

#COPY ./etc-pki-entitlement/*.pem /etc/pki/entitlement/.
#COPY ./etc-pki-entitlement/rhsm.conf /etc/rhsm/.


RUN \
#    rm /etc/rhsm-host && \
    yum update -y && \
    yum install -y  \
#       iputils \
       ca-certificates \
#       vim-enhanced  \
       less \
#       procps-ng \
       openssl && \
#       telnet \
#       iproute && \
    yum clean all

COPY config/README /etc/README

COPY --from=builder /opt/app-root/src/lego/dist/lego /usr/bin/lego
COPY --from=builder /tmp/lego-release /LEGO-RELEASE

# Create dir for the bind mount
RUN mkdir -p /lego && \
  chgrp -R 0 /lego && \
  chmod -R g=u /lego



ENTRYPOINT [ "/usr/bin/lego" ]
