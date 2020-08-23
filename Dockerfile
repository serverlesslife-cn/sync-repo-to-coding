FROM alpine:latest

RUN apk add --no-cache git openssh-client && \
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN chmod a+x *.sh 

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
