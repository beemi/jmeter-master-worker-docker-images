FROM ghcr.io/beemi/jmeter-docker-base-image:v1.0.2

RUN apk update && \
    apk add --no-cache curl git python3 py3-pip groff && \
    pip3 install --upgrade pip && \
    pip3 install awscli && \
    rm -rf /var/cache/apk/* && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.7/bin/linux/amd64/kubectl && \
    chmod u+x kubectl && \
    mv kubectl /bin/kubectl

ADD ./*.sh /opt/jaitechltd/scripts/
RUN chmod +x *.sh

EXPOSE 60000

WORKDIR $JMETER_BIN

# Application to run on starting the container
ENTRYPOINT ["sh", "/opt/jaitechltd/scripts/entrypoint.sh"]
