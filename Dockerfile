FROM java:8-alpine
ENV LEIN_ROOT true
RUN mkdir ~/.lein && echo '{:user {:plugins [[lein-try "0.4.3"]]}}' >> ~/.lein/profiles.clj
WORKDIR /usr/bin
RUN apk update && apk add bash && wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod +x lein && bash -l -c 'echo "(+ 2 2)" | lein repl' && rm -r /tmp/* /var/cache/apk/*
CMD ["lein", "repl"]

