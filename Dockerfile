FROM alpine:3.13.5

# Login 1
ENV USERNAME=none
ENV PASSWORD=none
ENV OPT_ARGS=

# Login 2
ENV USERNAME2=none
ENV PASSWORD2=none
ENV OPT_ARGS2=

ENV XMLTV_FILENAME=xmltv.xml

# Wait 12 Hours after run
ENV SLEEPTIME=43200

RUN apk add --no-cache \
  perl \
  perl-http-cookies \
  perl-lwp-useragent-determined \
  perl-json \
  perl-json-xs \
  perl-lwp-protocol-https \
  perl-gd

VOLUME /data
ADD zap2xml.pl /zap2xml.pl
ADD entry.sh /entry.sh
RUN chmod 755 /entry.sh /zap2xml.pl

CMD ["/entry.sh"]
