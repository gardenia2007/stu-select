import web
from config import setting

class Admin:
	def __init__(self):
		if not (web.ctx.session.is_login and web.ctx.session.is_admin):
			raise web.seeother('/login')

class User:
	def __init__(self):
		if web.ctx.session.is_login == False:
			raise web.seeother('/login')
	def error(self, msg):
		return setting.render.error_page(web.ctx.session, '', msg)
	def success(self, msg):
		return setting.render.success_page(web.ctx.session, '', msg)


