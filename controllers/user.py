# -*- coding: utf-8 -*- 

import web
import random
from config import setting
from auth import User

render = web.config._render
db = web.config._db

class Index(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		pass
	def POST(self):
		pass

class UpdatePw(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.user.update_pw(self.session, 'update_pw')
	def POST(self):
		i,role = web.input(), self.session.role
		if i.new_password != i.new_password2:
			return self.error('两次输入的新密码不匹配，请重新输入!')
		if len(i.new_password) <= 3:
			return self.error('新密码长度太短！<br>为了帐号安全，请设置比较复杂的密码。')
		if self.session.is_admin == True:
			vars = {'name':'admin', 'pw':i.old_password}
		else:
			vars = {'id':self.session.uid, 'pw':i.old_password}
		old = db.select(role, where=web.db.sqlwhere(vars))
		if len(old.list()) <= 0:
			return self.error('原密码不正确，请重新输入!')
		if self.session.is_admin == True:
			vars = {'name':'admin'}
		else:
			vars = {'id':self.session.uid}
		db.update(role, where=web.db.sqlwhere(vars), pw=i.new_password)
		return self.success('密码修改成功！')
		
