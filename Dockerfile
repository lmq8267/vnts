FROM busybox:latest
ARG TARGETARCH
ARG TARGETVARIANT

ADD vnts_$TARGETARCH$TARGETVARIANT /usr/bin/vnts

RUN chmod +x /usr/bin/vnts

WORKDIR /app
ENV TZ Asia/Shanghai
ENV LANG=zh_CN
EXPOSE 29872/tcp
EXPOSE 29872/udp
EXPOSE 29870/tcp
VOLUME /app

ENTRYPOINT ["/usr/bin/vnts"]
