# coding: utf-8
import logging
import os

from dynaconf import settings
from pymongo import MongoClient, errors

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)

MONGO_STR_CONN = 'mongodb://{user}:{pwd}@{host}:{port}/{db}'


def get_multivac_db():
    # Load pass from environment if not None, else, from settings (.secrets)
    mongo_pass = os.environ.get('MONGO_PASSWORD') or settings.MONGO_PASSWORD

    mongo_uri = MONGO_STR_CONN.format(
        user=settings.MONGO_USERNAME,
        pwd=mongo_pass,
        host=settings.MONGO_SERVER,
        port=settings.MONGO_PORT,
        db=settings.MONGO_DB_NAME)
    try:
        client = MongoClient(mongo_uri)
        db = client.get_database(settings.MONGO_DB_NAME)
        return db
    except errors.ServerSelectionTimeoutError as err:
        log.debug('Failed to connect to Mongo: %s' % mongo_uri)
        raise err
