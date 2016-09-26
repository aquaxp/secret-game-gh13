#!/usr/bin/env python
"""Entry point for server"""

from flask.ext.restful import reqparse, abort, Api, Resource
from flask import Flask
from api import *

app = Flask(__name__)
api = Api(app)

api.add_resource(Auth, '/auth')
api.add_resource(Games, '/games/<string:user_id>')
api.add_resource(Control, '/c2c')
api.add_resource(Hello, '/')
api.add_resource(State, '/state')

if __name__ == '__main__':
    app.run(debug=False)
