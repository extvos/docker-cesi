FROM extvos/python

MAINTAINER Mingcai SHEN <archsh@gmail.com>

ENV CESI_USERINFO_FILE /cesi/userinfo.db

RUN apk update \
    && apk add sqlite sqlite-dev sqlite-libs py-flask git \
    && git clone https://github.com/Gamegos/cesi \
    && mkdir /var/log/cesi \
    && touch $CESI_USERINFO_FILE \
    && sqlite3 $CESI_USERINFO_FILE < cesi/userinfo.sql

EXPOSE 5000 

ENTRYPOINT ["python"]

CMD ["/cesi/cesi/web.py"]