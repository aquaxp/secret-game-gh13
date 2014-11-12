#api_classes
from typesCol import *
from flask.ext.restful import reqparse, abort, Api, Resource
import math

class Hello(Resource):
    def get(self):
        return "Welcome to the battlefield", 201

def distance(lat1, lon1, acc1, lat2, lon2, acc2):
    """Method to calculate Distance between two sets of Lat/Lon."""
    earth = 6371 #Earth's Radius in Kms.
    #if acc1 > 500 or acc2 > 500:
    #    return 500
    #Calculate Distance based in Haversine Formula
    dlat = math.radians(lat2-lat1)
    dlon = math.radians(lon2-lon1)
    a = math.sin(dlat/2) * math.sin(dlat/2) + math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dlon/2) * math.sin(dlon/2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    d = earth * c
    return d

@db_session
def collisionDetection(uuid):
    user = User.get(uuid=uuid)
    game = user.activeGame
    fla = 0
    if game is None:
        return -1
    for u in game.users:
        if u.uuid == uuid:
            continue
        if distance(user.curentLocation.latitude, user.curentLocation.longitude, user.curentLocation.accuracy, u.curentLocation.latitude, u.curentLocation.longitude, u.curentLocation.accuracy) < 0.300:
            if Collision.get(game=game.name,uuid1=user.uuid,uuid2=u.uuid) is None:
                Collision(game=game.name,uuid1=user.uuid,uuid2=u.uuid)
                if Collision.get(game=game.name,uuid1=u.uuid,uuid2=user.uuid) is None:
                    Collision(game=game.name,uuid1=u.uuid,uuid2=user.uuid)
                fla = 1
            else:
                continue
        else:
            continue
    return fla

@db_session
def user_stuff(args):
    user = User.get(uuid=args['uuid'])
    if user is None:
        user = User(uuid=args['uuid'])
    
    current = Location.get(user=user)
    if current is None:
        current = Location(longitude=args['longitude'], latitude=args['latitude'], accuracy=args['accuracy'], user=user, date=datetime.datetime.now())
    else:
        current.longitude=args['longitude']
        current.latitude=args['latitude']
        current.accuracy=args['accuracy']
        current.date=datetime.datetime.now()
    user.current_location = current

class Auth(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('uuid', type=str, location='json')
        parser.add_argument('longitude', type=float, location='json')
        parser.add_argument('latitude', type=float, location='json')
        parser.add_argument('accuracy', type=float, location='json')
        args = parser.parse_args()

        user_stuff(args)
        if collisionDetection(args['uuid']) == 1:
            return 'collision detected', 201
        elif collisionDetection(args['uuid']) == -1:
            return 'nogame for collision detection', 201
        #trigger 
        us = {
            'uuid':args['uuid'],
            'accuracy':args['accuracy'],
            'longitude':args['longitude']

        }
        return us, 201

class Games(Resource):
    @db_session
    def get(self, user_id):
        print user_id
        all_games = Game.order_by(Game.name)

        if len(all_games)> 0:
            resp = []
            for g in all_games:
                if User.get(uuid=user_id) is None:
                    return "            bad_id    ",404

                if User.get(uuid=user_id) in g.users:
                    act = 1
                else:
                    act = 0
                info ={
                    'name':g.name,
                    'users':len(g.users),
                    'start':(g.start).isoformat(),
                    'end':g.end.isoformat(),
                    'active':act
                    #gulag
                    }
                resp.append(info)
            return resp, 201
        return [],202

    @db_session
    def post(self,user_id):
        parser = reqparse.RequestParser()
        parser.add_argument('uuid', type=str, location='json')
        parser.add_argument('action', type=str, location='json')
        parser.add_argument('longitude', type=float, location='json')
        parser.add_argument('latitude', type=float, location='json')
        parser.add_argument('accuracy', type=float, location='json')
        parser.add_argument('gamename', type=str, location='json')
        args = parser.parse_args()
        user_stuff(args)

        user = User.get(uuid=args['uuid'])

        if args['action'] == 'subscribe':
            selgame = Game.get(name=args['gamename'])
            if selgame is None:
                return "{'error':'notfound'}", 202
            print user.activeGame
            if user.activeGame is None:
                user.activeGame = selgame
                selgame.users += user
            else:
                user.activeGame.users -= user
                selgame.users += user
                user.activeGame = selgame
            return "good", 201

        if args['action'] == 'unsubscribe':
            selgame = Game.get(name=args['gamename'])
            if selgame is None:
                return "{'error':'notfound'}", 202
            if user.activeGame is None:
                return "not for unsubscribing", 201
            else:
                user.activeGame = None
                selgame.users -= user_stuff





        #if args['unsubscribe'] == '1':

       # if (args['subscribe'])


    #def checkActiveGame

class Control(Resource):
    @db_session
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('action', type=str, location='json')
        parser.add_argument('name', type=str, location='json')
        parser.add_argument('start', type=str, location='json')
        parser.add_argument('end', type=str, location='json')
        parser.add_argument('gulag', type=str, location='json')
        args = parser.parse_args()

        if args['action'] == 'creategame':
            game = Game.get(name=args['name'])
            if game is None:
                game = Game(name=args['name'],start=dateutil.parser.parse(args['start']), end=dateutil.parser.parse(args['end']))

            return "success creation", 201
        elif args['action'] == 'deletegame':
            game = Game.get(name=args['name'])
            if game is None:
                return "notfound", 201
            else:
                game.delete()
                return "deleted!", 201

        else:
            return "somesing goes bad",202

class State(Resource):
    @db_session
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('uuid', type=str, location='json')
        parser.add_argument('longitude', type=float, location='json')
        parser.add_argument('latitude', type=float, location='json')
        parser.add_argument('accuracy', type=float, location='json')
        args = parser.parse_args()

        user_stuff(args)

        #if collisionDetection(args['uuid']) == 1:
        #    return 'collision detected', 201

        if User.get(uuid=args['uuid']).activeGame is None:
            return "nogame for state request"
        else:
            resp = []
            for u in User.get(uuid=args['uuid']).activeGame.users:
                points = 0
                collision = 0

                if Collision.get(game=u.activeGame.name,uuid1=args['uuid'],uuid2=u.uuid) is None:
                    collision = 0
                else:
                    collision = 1
                # len(select(col for col in Collision if col.uuid1 == u.uuid1))


                # select(us for us in User if )
                # select(c for c in Customer if sum(c.orders.total_price) > 1000)
                # select(p for p in Person).order_by(Person.name)
                
                info = {
                    'uuid':u.uuid,
                    'latitude':u.curentLocation.latitude,
                    'longitude':u.curentLocation.longitude,
                    'points':len(select(col for col in Collision if (col.uuid1 == u.uuid and col.game == u.activeGame.name))),
                    'collision':collision,
                    'accuracy':u.curentLocation.accuracy
                }
                resp.append(info)

            if collisionDetection(args['uuid']) == 1:
                return resp, 201

            return resp, 201


























