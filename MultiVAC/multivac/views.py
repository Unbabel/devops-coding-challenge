import json
import logging
from rq import Queue
from config import get_multivac_db, get_redis_connection
from multivac.process_data import process_data
from flask import Blueprint, request, Response, redirect, url_for




db = get_multivac_db()
redis_connection = get_redis_connection()

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)
log.debug(db)

multivac_bp = Blueprint(
    'multivac',
    __name__,
    template_folder="templates"
)


@multivac_bp.route("/")
def homepage():
    return "Welcome to MultiVAC2!"


@multivac_bp.route("/multivac", methods=['GET'])
def get_multivac():

    n_answer = db.entropy.find().count()
    if n_answer == 0:
        return "INSUFFICIENT DATA FOR MEANINGFUL ANSWER."
    else:
        answer = db.entropy.find_one()['data']
        return answer


@multivac_bp.route("/multivac/data", methods=['POST'])
def post_multivac():
    value = request.form['data']

    q = Queue("default", connection=redis_connection)
    q.enqueue_call(process_data, args=(value, ))

    return Response(response=json.dumps({"response": "MultiVAC updated!"}),
                    status=200, mimetype="application/json")

@multivac_bp.route("/zzz", methods=['GET'])
def get_zzz():
    return "LET THERE BE LIGHT!"

