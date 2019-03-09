FROM docker:stable

RUN apk --update add openssh rsync

# Start crond with log level 8 in foreground, output to stderr
CMD crontab /crontab && crond -f -d 8