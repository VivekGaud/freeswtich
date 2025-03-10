FROM alpine:3.17

RUN apk --update --no-cache add \
    nano \
    git \
    freeswitch \
    freeswitch-python3 \
    freeswitch-sample-config \
    freeswitch-sounds-en-us-callie-8000 \
    python3 \
    py3-pip

RUN pip3 install redis

RUN git clone https://github.com/sonudev7860/freeswitch-python-enabled-modules.conf.xml.git /tmp/modules && \
    cp /tmp/modules/modules.conf.xml /etc/freeswitch/autoload_configs/modules.conf.xml && \
    rm -rf /tmp/modules

CMD ["freeswitch", "-nonat"]