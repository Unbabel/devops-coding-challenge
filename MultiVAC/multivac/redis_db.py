# coding: utf-8
import logging
import os

from dynaconf import settings
from redis import StrictRedis, exceptions

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)


def get_connection():
    # TODO: Change this to a more dynamic/modularized aproach
    redis_pass = os.environ.get('REDIS_PASSWORD') or settings.REDIS_PASSWORD

    try:
        conn = StrictRedis(
            host=settings.REDIS_HOST,
            port=settings.REDIS_PORT,
            password=redis_pass,
            db=settings.REDIS_DB_NAME)
        log.debug(conn)
        conn.ping()
        return conn
    except exceptions.ConnectionError as err:
        log.debug('Failed to connect to Redis: %s' 'a')
        raise err
