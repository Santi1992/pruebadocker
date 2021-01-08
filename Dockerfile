FROM python:3.8-slim-buster

LABEL maintainer="Santiago Rueda <srueda@cloveranalytica.com>"

RUN apt-get -y update && apt-get -y install sudo && \
    adduser --disabled-password --gecos '' docker && \
    adduser docker sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    apt-get install --no-install-recommends -qq -y build-essential && \	
    sudo apt install -qq -y default-libmysqlclient-dev

WORKDIR /app

#copy project code
COPY requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r /app/requirements.txt

WORKDIR /app
# creo directorio de trabajo y le digo que copie todo dentro de ese directorio. el copie todo es el .
COPY . /app



ENV SECRET_KEY="" database=""  
# Puedo pasar muchas variables de entorno


EXPOSE 5001

WORKDIR /app/app 
# acá a dentro ejecuta!, esta el ejecutable


ENTRYPOINT [ "gunicorn" ]


CMD ["-c","config/gunicorn.py","app:create_app()"]

# Ejecuta desde python 3 el archivo app.py
# Ejecuto de vuelta:::::  sudo docker build -t flaskapp3 .     (El punto es para que tome todos los archivos)     :::::::::::: CREO IMAGEN !!
# sudo docker run -it --publish 80:80 flaskapp3       ! Para poder acceder al puerto 4000 de python a traves del 7000
# Ahora la aplicación se ejecuta desde el contenedor.
# TENGO QUE ENTRAR AL LOCALHOST 3000 AHORA. --> se ejecuta desde docker.
# sudo docker run -it --publish 5001:5001 -d flaskapp   # Con este comando se ejecuta en segundo plano
#  para pararlo docker stop 'id'

# docker images purge  : elimino imagenes.

# pip freeze > requirements. txt


#docker exec -it <mycontainer> /bin/bash