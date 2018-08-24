# Using lightweight alpine image
FROM python:3.6-alpine

LABEL mantainer="arthur0"

COPY *.py /app/

COPY requirements.txt /app/

COPY multivac/ /app/

WORKDIR /app

# TODO: Change to COPY/install ONBUILD
RUN pip install -r requirements.txt

ENV FLASK_APP='multivac.app'

ENV FLASK_ENV='development'

ENV SETTINGS_MODULE_FOR_DYNACONF='settings.toml,.secrets.toml'

ENV MONGO_PASSWORD='changeit'

ENV REDIS_PASSWORD='changeit'

EXPOSE 5000

ENTRYPOINT [ "python", "manage.py"]