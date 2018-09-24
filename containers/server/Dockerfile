FROM python:3.6

LABEL MAINTAINER="Rui Grafino"
LABEL PROJECT="DevOps Challenge"
LABEL ROLE="Server"

COPY MultiVAC/ /server/
COPY .env /server
WORKDIR /server
RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "runserver" ]
ENTRYPOINT [ "python", "manage.py" ]
