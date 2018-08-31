FROM openjdk:8-jre

ENV CLI_HOME=/opt/pmis/cli \
    CLI_SHARE_SCRIPT_HOME=share/scripts \
    PATH=$CLI_HOME:$PATH

ARG archive=stnd_pmis-cli.tar

COPY ./system_config_ko.properties /tmp/conf/
COPY ./$archive $CLI_HOME/
RUN set -ex && \
    apt-get update && apt-get -y install \
      ant \
      ant-optional && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cd $CLI_HOME && \
    tar -xf $archive && rm $archive && \
    cp -a /tmp/conf/* $CLI_HOME/WEB-INF/classes && \
    mkdir -p $CLI_SHARE_SCRIPT_HOME && \
    rm -rf /tmp/*

WORKDIR $CLI_HOME
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT ["launch.sh"]