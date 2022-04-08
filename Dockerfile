FROM node:14-alpine
WORKDIR /usr/app
COPY . .
RUN yarn
RUN yarn build
COPY . .
EXPOSE 3000
CMD ["yarn", "start"]
