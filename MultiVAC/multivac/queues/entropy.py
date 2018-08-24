# coding: utf-8
import logging

from multivac import mongo_db

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)


def process_data(value):
    log.debug('Queue entropy: Prossessing data...')
    db = mongo_db.get_multivac_db()
    db.entropy.insert_one({'data': value})
