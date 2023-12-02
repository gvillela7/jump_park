FROM node:16-alpine3.17
RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY --chown=www-data:www-data ./doc /opt/app
RUN npm install insomnia-documenter
RUN npx insomnia-documenter --config Insomnia_2023-12-02.json

EXPOSE 3000
CMD [ "npx", "serve"]
