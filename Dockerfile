FROM elixir:alpine

RUN apk add --update npm

WORKDIR /app
COPY . /app

RUN mix local.hex --force && \
    mix local.rebar --force

ENV MIX_ENV=prod
ENV DATABASE_URL="url_is_overridden_by_compose_file"
ENV SECRET_KEY_BASE="1ded6u9PuqIsztiVR+mSoTLwQrmY/bV92af1kA3q648Xi3zlgGh9ldTYaGG/3HNH"

RUN mix deps.get --only $MIX_ENV && \
    mix compile

RUN npm install --prefix ./assets && \
    npm rebuild node-sass --prefix ./assets && \
    npm run deploy --prefix ./assets && \
    mix phx.digest

CMD ["mix", "phx.server"]

EXPOSE 4000
