FROM debian:stable
RUN apt-get update && apt install -y default-jre wget curl
RUN curl -s -L http://www.nxfilter.org/|grep Download \
  |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" \
  |grep download|uniq \
  |xargs -n1 curl -s -L \
  |grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" \
  |grep filter-.*deb|grep -v mediafire \
  |xargs -n1 wget -q && dpkg -i nxfilter*.deb && rm nxfilter*.deb

RUN cp -R /nxfilter/conf /nxfilter/conf-default

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/nxfilter/bin/startup.sh"]

