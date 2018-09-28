FROM python:3.6

LABEL MAINTAINER="Rui Grafino"
LABEL PROJECT="DevOps Challenge"
LABEL ROLE="Worker" 

COPY MultiVAC/ /worker
COPY .env /worker
WORKDIR /worker
RUN pip install -r requirements.txt

CMD [ "worker" ]
ENTRYPOINT [ "python", "manage.py"]
