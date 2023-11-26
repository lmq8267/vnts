FROM busybox:latest
ARG TARGETARCH
ARG TARGETVARIANT

ADD vnts_$TARGETARCH$TARGETVARIANT /usr/bin/vnts
RUN chmod +x /usr/bin/vnts 
ENTRYPOINT ["/usr/bin/vnts"]
