# FROM drujensen/crystal:0.23.1
FROM amberframework/amber:1.3.2 AS development

ARG AMBER_ENV=production
ENV AMBER_ENV=${AMBER_ENV}

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}}

WORKDIR /app/user

ADD . /app/user

RUN npm install -g \ 
        yarn

RUN shards install

EXPOSE 3000
# CMD ["crystal", "spec"]
CMD ["amber", "watch"]

FROM amberframework/amber:1.3.2 AS builder

ENV AMBER_ENV=production
ENV NODE_ENV=production

COPY --from=development /app/user /app/user

WORKDIR /app/user

RUN npm install --prod && \
    npm run release && \
    shards install --production && \
    shards build amberframework --release


##
# Production stage
##
FROM bitnami/minideb AS production

ENV AMBER_ENV=production
# ENV AMBER_HOST=0.0.0.0
# ENV AMBER_PORT=8080
ENV NODE_ENV=production

# RUN apt update && \
#     apt install -y libyaml-0-2

COPY --from=builder /usr/lib/x86_64-linux-gnu/*libyaml* /usr/lib/x86_64-linux-gnu/
COPY --from=builder /usr/lib/x86_64-linux-gnu/*libssl* /usr/lib/x86_64-linux-gnu/
COPY --from=builder /usr/lib/x86_64-linux-gnu/*libcrypto* /usr/lib/x86_64-linux-gnu/
COPY --from=builder /usr/lib/x86_64-linux-gnu/*libpcre* /usr/lib/x86_64-linux-gnu/
COPY --from=builder /usr/lib/x86_64-linux-gnu/*libevent* /usr/lib/x86_64-linux-gnu/

COPY --from=builder /app/user/blog /app/user/blog
COPY --from=builder /app/user/config /app/user/config
COPY --from=builder /app/user/public /app/user/public
COPY --from=builder /app/user/bin/amberframework /app/user/bin/amberframework

WORKDIR /app/user

CMD [ "bash", "-c", "bin/amberframework" ]