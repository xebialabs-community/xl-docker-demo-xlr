FROM frolvlad/alpine-glibc:latest

ENV OPENSHIFT_VERSION v1.3.0
ENV OPENSHIFT_HASH 3ab7af3d097b57f933eccef684a714f2368804e7
ENV JAVA_HOME=/usr/lib/jvm/default-jvm

RUN apk add --no-cache --virtual \
        curl \
        tar \
    && apk --update add ca-certificates \
    && apk --no-cache add curl \
    && apk --no-cache add openjdk8 \
    && ln -sf "${JAVA_HOME}/bin/"* "/usr/bin/" \
    && curl --retry 7 -Lso /tmp/client-tools.tar.gz "https://github.com/openshift/origin/releases/download/${OPENSHIFT_VERSION}/openshift-origin-client-tools-${OPENSHIFT_VERSION}-${OPENSHIFT_HASH}-linux-64bit.tar.gz" \
    && tar zxf /tmp/client-tools.tar.gz --strip-components=1 -C /usr/local/bin \
    && rm /tmp/client-tools.tar.gz

RUN apk update && apk add wget
RUN wget -O /tmp/xl-release-trial.zip https://dist.xebialabs.com/xl-release-trial.zip && mkdir -p /opt/xlr && unzip /tmp/xl-release-trial.zip -d /opt/xlr && mv /opt/xlr/xl-release-*-server /opt/xlr/server && rm -rf /tmp/xl-release-trial.zip
ADD resources/xl-release-server.conf /opt/xlr/server/conf/xl-release-server.conf
ADD resources/xl-release.conf /opt/xlr/server/conf/xl-release.conf
ADD resources/synthetic.xml /opt/xlr/server/ext/synthetic.xml
CMD ["/opt/xlr/server/bin/run.sh"]
EXPOSE 5516

RUN chmod -R 775 /opt/xlr

# Add plugin(s)
RUN curl --retry 7 -Lso /opt/xlr/server/plugins/xlr-openshift-plugin-1.0.5.jar https://github.com/xebialabs-community/xlr-openshift-plugin/releases/download/v1.0.5/xlr-openshift-plugin-1.0.5.jar

