# Imagen base
FROM python:3.11-slim

# Crear directorio de la app
WORKDIR /app

# Evitar usar root
RUN useradd -m django_user
USER django_user

# Copiar requirements primero (para aprovechar cache)
COPY --chown=django_user:django_user requirements.txt /app/

# Instalar dependencias
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el proyecto
COPY --chown=django_user:django_user . /app/

# Puerto que expondrá la app
EXPOSE 8000

# Comando por defecto
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
