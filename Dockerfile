#
# From HTTPX web server.
FROM registry.cn-hangzhou.aliyuncs.com/ossrs/httpx
# HTTP/80, HTTPS/443
EXPOSE 80 443
# SRS releases files.
COPY index.html /usr/local/srs.release/index.html
COPY crossdomain.xml /usr/local/srs.release/crossdomain.xml
COPY favicon.ico /usr/local/srs.release/favicon.ico
COPY http-rest /usr/local/srs.release/http-rest
COPY images /usr/local/srs.release/images
COPY releases /usr/local/srs.release/releases
COPY srs-console /usr/local/srs.release/srs-console
COPY trunk /usr/local/srs.release/trunk
# Default workdir and command.
WORKDIR /usr/local
CMD ["./bin/httpx-static", \
    "-http", "80", "-root", "./srs.release" \
    ]
