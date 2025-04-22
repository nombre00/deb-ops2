FROM python:3.12-slim
# Crea un directorio y lo llama app
WORKDIR /app 
# Copiamos el contenido de web en la carpeta app (El proyecto)
COPY web /app/
# Copiamos el archivo requetimientos.txt en app (Librerías que necesita el proyecto)
COPY requerimientos.txt /app/
# Va a instalar los requerimientos del archivo indicado
RUN pip install -r requerimientos.txt
# Exponemos un puerto, django trabaja con el puerto 8000.
EXPOSE 8000
# Ingresar a la carpeta donde está el archivo de ejecución.
RUN cd /app/web
# Ejecutamos el comando señalado, estos comandos se encuentran dentro de una lista de strings.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


# Comandos para correr el código:     // El nombre del proyecto es: proyectoweb-1
    # docker build -t (nombre) .  (el punto al final es necesario)    // construye.
    # docker run -itd -p 80:8000 --name servidorDjango (nombre)       // corre.