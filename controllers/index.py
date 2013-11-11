import web
import re
import base64
import urllib
from config import setting

render = setting.render
db = setting.db

class Index:
    def GET(self):
    	if web.ctx.session.is_login == False:
    		web.seeother('/login')
    	else:
    		web.seeother('/student')
    def POST(self):
        pass

class Logout:
    def GET(self):
    	web.ctx.session.kill()
    	web.seeother('/')
    def POST(self):
        pass

class Login:
	def GET(self):
		return render.login()
	def login_as(self, role, i):
		sql = "SELECT * FROM %s WHERE name=$n AND pw=$p"%(role)
		results = list(db.query(sql, vars={'n':i.username, 'p':i.password}))
		if len(results) >= 1:
			web.ctx.session.is_login = True
			web.ctx.session.uid = results[0].id
			web.ctx.session.name = results[0].name
			web.ctx.session.role= role
			web.ctx.session.is_admin = False
			web.seeother('/')
			return True
		else:
			return False
	def POST(self):
		i = web.input()
		if i.username == 'admin' and i.password == 'admin':
			web.ctx.session.name = 'Admin'
			web.ctx.session.role= 'admin'
			web.ctx.session.is_login = True
			web.ctx.session.is_admin = True
			web.seeother('/')
			return
		# results = list(db.select('user', where=web.db.sqlwhere({'name':i.username, 'password':i.password})))
		if(self.login_as('student', i)):
			return
		elif(self.login_as('teacher', i)):
			return
		else:
			return render.login()

class DBtest:
    def GET(self):
        data = db.select('test')
        for x in data:
        	pass
    def POST(self):
        pass

class Test:
	def GET(self):
		pass

	def POST():
		pass

