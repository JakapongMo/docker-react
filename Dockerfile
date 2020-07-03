# multi-step build
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
# This container need port map 80
EXPOSE 80
# From destination path from nginx doc
COPY --from=0 /app/build /usr/share/nginx/html


