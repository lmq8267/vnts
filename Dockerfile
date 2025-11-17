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
VOLUME /usr/bin/vnts_wg

RUN echo '#!/bin/sh' > /entrypoint.sh && \  
    echo 'LOG_DIR=/usr/bin/log' >> /entrypoint.sh && \  
    echo 'LOG_CONFIG=$LOG_DIR/log4rs.yaml' >> /entrypoint.sh && \  
    echo 'mkdir -p $LOG_DIR' >> /entrypoint.sh && \  
    echo 'if [ ! -f "$LOG_CONFIG" ] || ! grep -q "kind: console" "$LOG_CONFIG"; then' >> /entrypoint.sh && \  
    echo '  cat > $LOG_CONFIG << EOF' >> /entrypoint.sh && \  
    echo 'refresh_rate: 30 seconds' >> /entrypoint.sh && \  
    echo 'appenders:' >> /entrypoint.sh && \  
    echo '  stdout:' >> /entrypoint.sh && \  
    echo '    kind: console' >> /entrypoint.sh && \  
    echo '    encoder:' >> /entrypoint.sh && \  
    echo '      pattern: "[{d(%Y-%m-%d %H:%M:%S)}]: {l} 【{M}】:{m}{n}"' >> /entrypoint.sh && \  
    echo 'root:' >> /entrypoint.sh && \  
    echo '  level: info' >> /entrypoint.sh && \  
    echo '  appenders:' >> /entrypoint.sh && \  
    echo '    - stdout' >> /entrypoint.sh && \  
    echo 'EOF' >> /entrypoint.sh && \  
    echo 'fi' >> /entrypoint.sh && \  
    echo 'exec /usr/bin/vnts "$@"' >> /entrypoint.sh && \  
    chmod +x /entrypoint.sh  
  
ENTRYPOINT ["/entrypoint.sh"]
