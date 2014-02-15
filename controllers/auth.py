# -*- coding: utf-8 -*- 
import web
from config import setting

class Admin:
	def __init__(self):
		self.session = web.config._session
		try:
			if not (self.session.is_login and self.session.is_admin):
				raise web.seeother('/login')
		except Exception, e:
			#raise e
			return self.error('未知错误，请重试。')
		else:
			pass
	def error(self, msg):
		return web.config._render.error_page(self.session, '', msg)
	def success(self, msg):
		return web.config._render.success_page(self.session, '', msg)

class User:
	def __init__(self):
		self.session = web.config._session
		try:
			if self.session.is_login == False:
				return web.seeother('/login')
		except Exception, e:
			print e
			raise self.error('未知错误，请重试。')
		else:
			pass
	def error(self, msg):
		return web.config._render.error_page(self.session, '', msg)
	def success(self, msg):
		return web.config._render.success_page(self.session, '', msg)


