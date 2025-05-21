FROM mysql:9.3
ENV MYSQL_ROOT_PASSWORD pwd
COPY ./sqlfiles/migration-v001.sql /docker-entrypoint-initdb.d
EXPOSE 3306
