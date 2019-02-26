FROM docker:stable

# Start crond with log level 8 in foreground, output to stderr
CMD crontab /crontab && crond -f -d 8