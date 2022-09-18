FROM ghcr.io/beemi/jmeter-docker-base-image:v1.0.2

ADD ./*.sh $JMETER_BIN/
RUN chmod +x *.sh

WORKDIR $JMETER_BIN

EXPOSE 50000 1099

# Application to run on jmeter worker starting the container
ENTRYPOINT ["sh","entrypoint.sh"]
