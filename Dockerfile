#
# From HTTPX web server.
FROM registry.cn-hangzhou.aliyuncs.com/ossrs/httpx
# HTTP/80, HTTPS/443
EXPOSE 80 443
# SRS releases files.
COPY index.html /usr/local/srs.release/index.html
COPY crossdomain.xml /usr/local/srs.release/crossdomain.xml
COPY favicon.ico /usr/local/srs.release/favicon.ico
COPY privacy /usr/local/srs.release/privacy
COPY nginx.html /usr/local/srs.release/nginx.html
COPY 50x.html /usr/local/srs.release/50x.html
COPY k8s/k8s.go.foo.yaml /usr/local/srs.release/k8s/
COPY http-rest /usr/local/srs.release/http-rest
COPY images /usr/local/srs.release/images
COPY releases /usr/local/srs.release/releases
COPY srs-console /usr/local/srs.release/srs-console
COPY trunk /usr/local/srs.release/trunk
COPY donation /usr/local/srs.release/donation
RUN (cd /usr/local/srs.release && ln -sf . srs.release)
RUN (cd /usr/local/srs.release && ln -sf trunk/research/console)
RUN (cd /usr/local/srs.release && ln -sf trunk/research/players)
RUN (cd /usr/local/srs.release && ln -sf trunk/3rdparty/signaling/www/demos)
# Default workdir and command.
WORKDIR /usr/local
CMD ["./bin/httpx-static", \
    "-http", "80", "-root", "./srs.release" \
    ]
