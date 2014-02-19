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
		raise web.seeother('/teacher/student/my')
	def POST(self):
		pass

class StudentMy(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		data = db.query("SELECT st.status, student.name, student.no, student.id from st, student \
			where st.teacher=%d and ( st.status='wait' or st.status='pass' or st.status='fail') \
			and student.id=st.student"%(self.session.uid))
		return render.teacher.student_my(self.session, 'student_my', data)

class TeacherAll(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.student.teacher_all(self.session, 'teacher_all')

class StudentInfo(User):
	def __init__(self):
		User.__init__(self)
	def GET(self, sid):
		data = db.select('student', dict(id=sid), where='id=$id')[0]
		return render.teacher.student_info(data, web.input().status)

class Info(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		data = db.select('teacher', where='id=%d'%(self.session.uid))[0]
		return render.teacher.info(self.session, 'teacher_info', data)
	def POST(self):
		i = web.input()
		# 设置默认头像
		if len(i.photo)==0:
			i.photo = setting.default_photo_url
		db.update('teacher', where='id=%d'%(self.session.uid), email=i.email,\
			phone=i.phone, office=i.office, intro=i.intro, lab=i.lab, photo=i.photo)
		return self.success('个人信息修改成功！')

class Pass(User):
	def __init__(self):
		User.__init__(self)
	def GET(self, st_id):
			db.update('st', web.db.sqlwhere({'id':st_id}), status='pass')
			web.seeother('/teacher/student/my')

class Fail(User):
	def __init__(self):
		User.__init__(self)
	def GET(self, st_id):
		try:
			db.query("UPDATE teacher SET has = has - 1 WHERE id = $id", vars={'id':self.session.uid})
			db.update('st', web.db.sqlwhere({'id':st_id}), status='fail')
		except Exception, e:
			print e
			return self.error('未知错误，请重试。')
		else:
			web.seeother('/teacher/student/my')
		
