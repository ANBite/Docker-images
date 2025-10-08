# Proyecto Django - Tienda de Peluches

Este proyecto es una aplicación Django para la venta de peluches, lista para ejecutarse usando **Docker** y **Docker Compose**.

---

## Requisitos previos

- [Python 3.11+](https://www.python.org/downloads/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop) (Windows/Mac)
- Git (opcional, para clonar el repositorio)

---

## Configuración del proyecto

1. Clonar el repositorio (si aplica):

```bash
git clone <URL_DEL_REPOSITORIO>
cd Docker-images


Crear y activar un entorno virtual:

python -m venv venv
.\venv\Scripts\activate   # Windows
# source venv/bin/activate # Mac/Linux

Instalar dependencias:
pip install -r requirements.txt


Crear archivo .env con las variables necesarias:
DJANGO_SECRET_KEY=tu_clave_secreta_aqui
DJANGO_DEBUG=True
POSTGRES_DB=peluches_db
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin123
POSTGRES_HOST=db
POSTGRES_PORT=5432


Levantar la aplicación con Docker
> Construir y ejecutar los contenedores:
  docker compose up --build

> Aplicar migraciones dentro del contenedor:
  docker compose exec web python manage.py migrate
  docker compose exec web python manage.py createsuperuser

> Acceder a la aplicación en el navegador:
  http://localhost:8000


ESTRUCTURA DEL PROYECTO
Docker-images/
├── mi_proyecto/       # Proyecto Django
│   ├── settings.py
│   └── ...
├── Peluches/          # App de la tienda de peluches
│   ├── models.py
│   ├── views.py
│   └── ...
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── .env
└── .dockerignore

Notas importantes

El contenedor de PostgreSQL está configurado con las credenciales del .env.
Todos los archivos ignorados en .dockerignore no se incluirán en la imagen Docker.
Cualquier cambio en los modelos requiere ejecutar:
docker compose exec web python manage.py makemigrations
docker compose exec web python manage.py migrate


