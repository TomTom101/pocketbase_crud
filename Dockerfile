FROM alpine

RUN apk add --no-cache \
    unzip \
    ca-certificates 

# RUN wget https://github.com/TomTom101/pocketbase_crud/releases/latest/download/pocketbase_crud.zip -O tmp.zip \
#     && unzip tmp.zip
ADD https://github.com/TomTom101/pocketbase_crud/releases/latest/download/pocketbase_crud.zip /
RUN unzip pocketbase_crud.zip

EXPOSE 8090

CMD ["/server/backend_linux", "serve", "--http=0.0.0.0:8090", "--publicDir", "/build/web", "--dir", "/mount"]