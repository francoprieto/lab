# Instalación e iniciación

```console
docker-compose up -d
```

*OBS:* Debe estar en el directorio lab donde exista docker-compose.yml y nginx.conf

# Comprobación

Ingresar a la url: http://localhost:9090

El jenkins va a solicitar una contraseña inicial para desbloquear, la cual se encuentra en:
 ```console
 /var/jenkins_home/secrets/initialAdminPassword
 ```

Para conseguir la contraseña debemos de:
* Ejecutar el comando que lista todos los contenedores

 ```console
 docker ps
 ```

 El resultado será algo como:

> CONTAINER ID  IMAGE                           COMMAND               CREATED         STATUS         PORTS                                             NAMES \
>696684340ef0  docker.io/jenkins/jenkins:lts                         43 minutes ago  Up 21 minutes  0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp  jenkins \
>2be707164749  docker.io/library/nginx:alpine  nginx -g daemon o...  43 minutes ago  Up 21 minutes  0.0.0.0:8888->80/tcp                              nginx

* Identificamos el CONTAINER_ID del jenkins (en el ejemplo es el 696684340ef0)

* Ejecutamos el siguiente comando:
> docker exec <CONTAINER_ID> cat /var/jenkins_home/secrets/initialAdminPassword

Para el ejemplo serìa: 
>docker exec 696684340ef0 cat /var/jenkins_home/secrets/initialAdminPassword


El resultado debería ser una contraseña parecida a esta:
>bd9c056dff014123b36c251167528e6e

* Copiamos la contraseña al jenkins y desbloqueamos

* En la siguiente opciòn seleccionamos *Install suggested plugins*

* Seguidamente se va a descargar e instalar los plugins básicos

* Al terminar nos pedirá que definamos las credenciales para el usuario administrador y el URL del jenkins, se recomienda dejar http://localhost:9090
