import web
import random
from config import setting
from auth import User

render = setting.render
db = setting.db

class Index(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		raise web.seeother('/status/value')
	def POST(self):
		pass

class Update_pw(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.user.update_pw(web.ctx.session)
		
