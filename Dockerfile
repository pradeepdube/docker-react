From node:alpine as builder
WORKDIR '/app'
COPY package.json .
Run npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html




