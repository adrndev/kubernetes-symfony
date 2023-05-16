FROM postgres:15

RUN apt update -y

RUN apt install -y awscli gpg

COPY do_backup.sh /

RUN chmod +x /do_backup.sh