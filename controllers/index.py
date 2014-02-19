# -*- coding: utf-8 -*- 

import web
import urllib
from config import setting

render = web.config._render
db = web.config._db

class Index:
    def GET(self):
	try:
		if web.config._session.is_login == False:
			return web.seeother('/login')
	except Exception, e:
		print e
		return self.error('未知错误，请重试。')
	else:
		web.seeother('/student')
    def POST(self):
        pass

class Logout:
    def GET(self):
    	web.config._session.kill()
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
		self.forbid_login = False
		if role == 'student': # 学生用学号登录
			sql = "SELECT id,name,status FROM %s WHERE no=$n AND pw=$p"%(role)
		else: # 教师用姓名
			sql = "SELECT id,name,status FROM %s WHERE name=$n AND pw=$p"%(role)
		results = list(db.query(sql, vars={'n':i.username, 'p':i.password}))
		if len(results) >= 1:
			if results[0].status == 'off':
				self.forbid_login = True
				return True
			web.config._session.is_login = True
			web.config._session.uid = results[0].id
			web.config._session.name = results[0].name
			web.config._session.role= role
			web.config._session.is_admin = False
			return True
		else:
			return False
	def POST(self):
		i = web.input()
		if i.grade != setting.config.grade:
			return web.seeother(setting.config.refer+'%s/login?post=1&username=%s&password=%s&grade=%s'\
				%(i.grade, i.username, i.password, i.grade))
		if i.username == 'admin':
			r = list(db.select('admin', where=web.db.sqlwhere({'name':i.username, 'pw':i.password})))
			if len(r) >= 1:
				web.config._session.name = 'Admin'
				web.config._session.role = 'admin'
				web.config._session.uid = 0
				web.config._session.is_login = True
				web.config._session.is_admin = True
			web.seeother('/admin')
			return
		elif(self.login_as('student', i)):
			if self.forbid_login: # 关闭了登录功能
				return web.config._render.error_page(web.config._session, '', "帐号登录已关闭，请等候通知")
			else:
				web.seeother('/student')
				return
		elif(self.login_as('teacher', i)):
			if self.forbid_login: # 关闭了登录功能
				return web.config._render.error_page(web.config._session, '', "帐号登录已关闭，请等候通知")
			else:
				web.seeother('/teacher')
				return
		else: # 正常的登录失败
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

