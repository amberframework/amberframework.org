FROM drujensen/crystal:0.23.1

ENV AMBER_VERSION 0.2.7

RUN curl -L https://github.com/amberframework/amber/archive/v$AMBER_VERSION.tar.gz | tar xvz -C /usr/local/share/. && cd /usr/local/share/amber-$AMBER_VERSION && crystal deps && make

RUN ln -s /usr/local/share/amber-$AMBER_VERSION/bin/amber /usr/local/bin/amber

WORKDIR /app/user

ADD . /app/user

RUN crystal deps

CMD ["crystal", "spec"]
