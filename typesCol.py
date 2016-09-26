# easy_install pony flask flask-restful
import os
import sys
import datetime
import dateutil.parser

try:
    from pony.orm import * #ORM
except ImportError:
    print 'This tool is using pony.orm, please install it from http://ponyorm.com'
    sys.exit(1)

if os.path.exists('data.sqlite'):
    db = Database("sqlite", "data.sqlite")
else:
    db = Database("sqlite", "data.sqlite", create_db=True)

# ORM Entities
class User(db.Entity):
    uuid = PrimaryKey(unicode)
    curentLocation = Optional('Location')
    activeGame = Optional('Game')
    collision1 = Optional('Collision')
    wins = Set('Score')

class Location(db.Entity):
    longitude = Required(float)
    latitude = Required(float)
    accuracy = Required(float)
    date = Optional(datetime.datetime)
    user = Optional(User)
    game = Optional('Game')

class Game(db.Entity):
    name = PrimaryKey(unicode)
    users = Set(User)
    start = Optional(datetime.datetime)
    end = Optional(datetime.datetime)
    gulag = Optional(Location)
    #collisions = Set('Collision')

class Collision(db.Entity):
    game = Required(unicode)
    uuid1 = Required(unicode)#origin of bumps
    uuid2 = Required(unicode)
    users = Set(User)

class Score(db.Entity):
    gamename = PrimaryKey(unicode)
    users = Set(User)
    winner = Optional(unicode) #uuid
    points = Optional(float) #points

sql_debug(False)
db.generate_mapping(create_tables=True)
