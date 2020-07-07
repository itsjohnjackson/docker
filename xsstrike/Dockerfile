FROM python:3.9.0b3-alpine3.11
RUN apk update
RUN apk add git
RUN git clone --depth=1 'https://github.com/s0md3v/XSStrike.git' /tmp/xsstrike

WORKDIR /tmp/xsstrike
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "xsstrike.py"]
