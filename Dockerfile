FROM frebib/builder:latest
MAINTAINER Joe Groocock <frebib@gmail.com>

ENV CHECK_INTERVAL="*/30 * * * *"
ENV CHGRP_PATHS="/config /release"

VOLUME /config /release
ADD bin/* /usr/local/bin/

ENTRYPOINT [ "/sbin/tini", "--", "run-docker", "autobuilder" ]
CMD [ "crond", "-f", "-l", "6", "-L", "/dev/stdout" ]
