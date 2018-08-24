import operator
import os
import sys

from dynaconf import FlaskDynaconf, settings
from flask_script import Command, Manager, Option, Server
from rq import Connection, Queue, Worker

from multivac import redis_db
from multivac.app import create_app

app = create_app()
manager = Manager(app)
FlaskDynaconf(app)

secret_key = os.environ.get('SECRET_KEY')
if secret_key is not None:
    settings.SECRET_KEY = secret_key


@manager.command
def worker():
    'Starts the worker loop'
    listen = ['default']
    redis_conn = redis_db.get_connection()
    with Connection(redis_conn):
        worker = Worker(map(Queue, listen))
        worker.work()


@manager.command
def list_routes():
    'Display registered routes'
    rules = []
    for rule in app.url_map.iter_rules():
        methods = ','.join(sorted(rule.methods))
        rules.append((rule.endpoint, methods, str(rule)))

    sort_by_rule = operator.itemgetter(2)
    for endpoint, methods, rule in sorted(rules, key=sort_by_rule):
        route = '{:50s} {:25s} {}'.format(endpoint, methods, rule)
        print(route)


class Test(Command):
    'Run tests'
    option_list = (
        Option('--path', '-n', dest='test_path', default=".", required=False),
    )

    def run(self, test_path="."):
        import unittest
        tests = unittest.TestLoader().discover('.')
        ret = unittest.TextTestRunner(verbosity=2).run(tests).wasSuccessful()
        sys.exit(not ret)


if __name__ == "__main__":
    manager.add_command('test', Test())
    manager.add_command('runserver', Server('0.0.0.0', port=5000))
    manager.run()

# TODO LIST:
# TODO: Change to built-in CLI: Click (low priority)
# TODO: Investigate Dynaconf bult-in override methods
#       for secrets can be passed as envoirment vars
# TODO: Add DebugToolbarExtension
# NOTE: Think about to separate configuration
# and CLI commands into two modules
