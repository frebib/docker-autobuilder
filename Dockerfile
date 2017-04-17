FROM frebib/builder:latest
MAINTAINER Joe Groocock <frebib@gmail.com>

#ARG CHECK_INTERVAL="*/30 * * * *"
ARG CHECK_INTERVAL="* * * * *"

RUN chmod 666 /dev/std* && \
    echo "$CHECK_INTERVAL check-updates" | crontab -

VOLUME /config /release
ADD bin/* /usr/local/bin/

CMD [ "crond", "-f", "-l", "6", "-L", "/dev/stdout" ]
