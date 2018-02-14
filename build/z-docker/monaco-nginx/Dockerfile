FROM nginx:alpine as builder
LABEL maintainer "Zate <zate75@gmail.com>"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git

#WORKDIR /go/src/github.com/user/app
WORKDIR /opt
#RUN git clone --recursive https://github.com/zate/monaco-go && \
#    cd monaco-go && \
#    git submodule update --recursive --remote
#WORKDIR /opt/monaco-go
#RUN ./all.sh

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

EXPOSE 8081
WORKDIR /
ADD docker-entrypoint.sh /
#CMD ["run", "serve"]
ENTRYPOINT ["/docker-entrypoint.sh"]

