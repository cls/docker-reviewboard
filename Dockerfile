FROM debian:jessie

RUN apt-get update && \
    apt-get install -y python-dev python-paramiko python-pillow python-pip python-psycopg2 \
                       git python-rbtools uwsgi uwsgi-plugin-python

RUN pip install reviewboard==2.5.7

ADD start.sh /start.sh
ADD uwsgi.ini /uwsgi.ini
ADD shell.sh /shell.sh

RUN chmod +x start.sh shell.sh

VOLUME ["/root/.ssh", "/media/"]

EXPOSE 8000

CMD /start.sh
