from flask import Flask
from flask.ext.restful import reqparse, abort, Api, Resource
from api import *

app = Flask(__name__)
api = Api(app)

api.add_resource(Auth, '/auth')
#api.add_resource(Games, '/games')
api.add_resource(Games, '/games/<string:user_id>')
api.add_resource(Control, '/c2c')
api.add_resource(Hello, '/')
api.add_resource(State, '/state')
#api.add_resource(Control, '/c2c')



if __name__ == '__main__':
    app.run(debug=True)
    pass