# Build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 

RUN npm run build

# Run phase

FROM nginx
# EXPOSE used by AWS elastic beanstalk only. not not used for local port opening
EXPOSE 80 
COPY --from=0 /app/build /usr/share/nginx/html