FROM python:slim-stretch

LABEL maintainer=ysicing

COPY . /opt/Hoto

WORKDIR /opt/Hoto

VOLUME /opt/Hoto

RUN pip install -r requirements.txt

RUN chmod +x /opt/Hoto/docker-entrypoint.sh

EXPOSE 4000

ENTRYPOINT ["/opt/Hoto/docker-entrypoint.sh"]