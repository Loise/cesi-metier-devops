FROM mysql:9.3
COPY ./sqlfiles /docker-entrypoint-initdb.d
EXPOSE 3306
