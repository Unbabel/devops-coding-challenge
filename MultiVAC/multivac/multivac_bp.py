# coding: utf-8
import json

from flask import Blueprint, Response, request
from rq import Queue

from multivac import mongo_db, redis_db
from multivac.queues import entropy

multivac_bp = Blueprint('multivac', __name__)


@multivac_bp.route("/", methods=["GET"])
def index():
    return "Welcome to Multivac!"


@multivac_bp.route("/multivac", methods=['GET'])
def get_multivac():
    db = mongo_db.get_multivac_db()
    if db.entropy.count() == 0:
        return "INSUFFICIENT DATA FOR MEANINGFUL ANSWER."
    else:
        answer = db.entropy.find_one()['data']
        return str(answer)


@multivac_bp.route("/multivac/data", methods=['POST'])
def post_multivac():
    redis_conn = redis_db.get_connection()
    value = request.form['data']

    q = Queue("default", connection=redis_conn)
    q.enqueue_call(func=entropy.process_data, args=(value, ))

    return Response(response=json.dumps({"response": "MultiVAC updated!"}),
                    status=200, mimetype="application/json")
