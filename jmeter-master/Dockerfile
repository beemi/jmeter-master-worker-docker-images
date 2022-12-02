FROM ghcr.io/beemi/jmeter-docker-base-image:v1.0.2

RUN apk update && \
    apk add --no-cache curl git python3 py3-pip groff && \
    pip3 install --upgrade pip && \
    pip3 install awscli && \
    rm -rf /var/cache/apk/* && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.7/bin/linux/amd64/kubectl && \
    chmod u+x kubectl && \
    mv kubectl /bin/kubectl

# Jmx files has been moved to ansible role
#ADD /jmeter-master/jmxfiles/*.jmx ${JMETER_BIN}/
# no need to copy csv files as they just need to be in jmeter worker containers
#COPY csvdata/*.csv ${JMETER_BIN}/

#ADD /jmeter-master/entrypoint.sh ${JMETER_BIN}/
ADD /jmeter-master/*.sh /opt/jaitechltd/scripts/
RUN chmod +x *.sh

WORKDIR $JMETER_BIN

EXPOSE 60000

# Application to run on starting the container
#ENTRYPOINT ["sh","entrypoint.sh"]
ENTRYPOINT ["sh", "/opt/jaitechltd/scripts/entrypoint.sh"]
