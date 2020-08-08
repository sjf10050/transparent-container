FROM debian:buster-slim


LABEL maintainer="Jay Song <sjf10050@outlook.com>" \
    org.opencontainers.image.authors="Jay Song <sjf10050@outlook.com>" \
    org.opencontainers.image.title="transparent-container" \
    org.opencontainers.image.description="" \
    org.opencontainers.image.url="https://github.com/sjf10050/transparent-container" \
    org.opencontainers.image.source="https://github.com/sjf10050/transparent-container" \
    org.opencontainers.image.documentation="https://github.com/sjf10050/transparent-container"


WORKDIR /opt/src



RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -yqq --no-install-recommends install \
         kmod iproute2  net-tools iptables  pkg-config  

COPY ./run.sh /opt/src/run.sh
RUN chmod 755 /opt/src/run.sh 

CMD ["/opt/src/run.sh"]
