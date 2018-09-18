FROM python:3.6

LABEL MAINTAINER="Rui Grafino"
LABEL PROJECT="DevOps Challenge"
LABEL ROLE="Worker 1"


COPY MultiVAC/ /worker/
COPY .env /worker/
WORKDIR /worker
RUN pip install -r requirements.txt

EXPOSE 5001

CMD [ "worker" ]
ENTRYPOINT [ "python", "manage.py"]
