#using node as base image
FROM node

#install package manager pm2 
RUN npm install pm2 -g


#copying file
COPY . .  

#port
EXPOSE 3000

#start application
CMD ["pm2-runtime", "examples/hello-world/index.js"]
