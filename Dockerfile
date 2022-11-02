FROM frrouting/frr

ENV DEAMONS_FILE /etc/frr/daemons

RUN sed -e 's/bgpd=no/bgpd=yes/' -i $DEAMONS_FILE
RUN sed -e 's/ospfd=no/ospfd=yes/' -i $DEAMONS_FILE
RUN sed -e 's/isisd=no/isisd=yes/' -i $DEAMONS_FILE