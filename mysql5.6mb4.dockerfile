FROM mysql:5.6

COPY utf8mb4.cnf /etc/mysql/conf.d/
ENV LANG C.UTF-8
