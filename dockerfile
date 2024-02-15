FROM node:20.11-alpine3.18 as builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:20.11-alpine3.18 as runtime

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY --from=builder /app/dist ./dist

EXPOSE 3001

# TODO: node ユーザーで実行する
CMD ["node", "./dist/app.js"]
