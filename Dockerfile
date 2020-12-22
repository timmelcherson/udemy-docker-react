FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# A new FROM statement will automatically act as a terminator for the first block when it completes.
FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html