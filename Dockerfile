FROM alpine:3.8

EXPOSE 3000

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 3000:3000 --name alpine_timeoff"

RUN apk add --no-cache \
    git \
    make \
    nodejs npm \
    python \
    vim
    
#RUN adduser --system app --home /app
#USER app
WORKDIR /app
RUN git clone https://github.com/timeoff-management/application.git timeoff-management
WORKDIR /app/timeoff-management

RUN npm install --production

ADD docker-entrypoint.sh /docker-entrypoint.sh

VOLUME [ "/app/timeoff-management/sqlite" ]

ENTRYPOINT ["sh","/docker-entrypoint.sh"]
