---  
FROM ubuntu:latest #На мой взгляд, использование последней версии образа может отрабатывать некорректно. Лучше указывать конкретную версию, например, ubuntu:24.04.  
MAINTAINER MyCompany #инструкция MAINTAINER считается устаревшей, и вместо неё сейчас используется инструкция LABEL  
  
COPY . /var/www/html #Лучше перенести вниз, после активных команд, и сделать как рабочую директорию  
RUN apt-get update -y  
RUN apt-get install -y nginx  #Множество слоёв не очень хорошо, для инструкции, поэтому эту строку лучше соединить с верхней  
CMD ["nginx", "-g", "daemon off;"]  
  
---  

### Испровленные инструкции  
На мой взгляд эта инструкция будет привильнее:  

---  
FROM ubuntu:24.04  
LABEL maintainer="MyCompany"  
WORKDIR /var/www/html  

RUN apt-get update -y && \
    apt-get install -y nginx

COPY ./var/www/html .
CMD ["nginx", "-g", "daemon off;"]  

---