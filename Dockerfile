FROM node:16-alpine as builder 
#running a build phase and then an RUN phase

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

#docker build . -> for building
# docker run -p 8080:80 <image_id> -> for running via nginx
# what we have done above is, we copied just the build part and run it via nginx image