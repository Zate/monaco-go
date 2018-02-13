FROM node:carbon as builder
LABEL maintainer "Zate <zate75@gmail.com>"

#WORKDIR /go/src/github.com/user/app
WORKDIR /opt
RUN git clone --recursive https://github.com/zate/monaco-go && \
    cd monaco-go && \
    git submodule update --recursive --remote
WORKDIR /opt/monaco-go
RUN ./all.sh

EXPOSE 8080

CMD ["run", "serve"]
ENTRYPOINT ["npm"]