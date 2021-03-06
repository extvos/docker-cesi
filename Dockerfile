FROM extvos/python

MAINTAINER Mingcai SHEN <archsh@gmail.com>

ENV CESI_USERINFO_FILE /cesi/userinfo.db

RUN apk update \
    && apk add --no-cache sqlite sqlite-dev sqlite-libs py-flask git \
    && git clone https://github.com/Gamegos/cesi \
    && mkdir /var/log/cesi \
    && touch $CESI_USERINFO_FILE \
    && sqlite3 $CESI_USERINFO_FILE < cesi/userinfo.sql \
    && apk del sqlite-dev git

EXPOSE 5000 

ENTRYPOINT ["python"]

CMD ["/cesi/cesi/web.py"]