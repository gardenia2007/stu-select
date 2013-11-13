# -*- coding: utf-8 -*- 

import web
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
		i = web.input(post='0')
		if i.post == '1':
			return self.POST()
		else:
			return render.login(True)
	def login_as(self, role, i):
		if role == 'student': # 学生用学号登录
			sql = "SELECT * FROM %s WHERE no=$n AND pw=$p"%(role)
		else: # 教师用姓名
			sql = "SELECT * FROM %s WHERE name=$n AND pw=$p"%(role)
		results = list(db.query(sql, vars={'n':i.username, 'p':i.password}))
		if len(results) >= 1:
			web.ctx.session.is_login = True
			web.ctx.session.uid = results[0].id
			web.ctx.session.name = results[0].name
			web.ctx.session.role= role
			web.ctx.session.is_admin = False
			web.seeother('/'+role)
			return True
		else:
			return False
	def POST(self):
		i = web.input()
		if i.grade != setting.config.grade:
			return web.seeother('http://127.0.0.1/select%s/login?post=1&username=%s&password=%s&grade=%s'\
				%(i.grade, i.username, i.password, i.grade))
		if i.username == 'admin':
			r = list(db.select('admin', where=web.db.sqlwhere({'name':i.username, 'pw':i.password})))
			if len(r) >= 1:
				web.ctx.session.name = 'Admin'
				web.ctx.session.role= 'admin'
				web.ctx.session.is_login = True
				web.ctx.session.is_admin = True
			web.seeother('/admin')
			return
		elif(self.login_as('student', i)):
			return
		elif(self.login_as('teacher', i)):
			return
		else:
			return render.login(False)

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

