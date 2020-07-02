# multi-step build
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
# From destination path from nginx doc
COPY --from=builder /app/build /usr/share/nginx/html


