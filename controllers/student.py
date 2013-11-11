# -*- coding: utf-8 -*- 

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
		raise web.seeother('/student/teacher/my')
	def POST(self):
		pass

class TeacherMy(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		r = db.query('SELECT st.status, teacher.* from student, st, teacher where st.id=student.st and teacher.id=st.teacher')
		if(len(r) <= 0):
			data = None
		else:
			data = r[0]
		return render.student.teacher_my(web.ctx.session, 'teacher_my', data)

class TeacherAll(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		data = {'teacher':db.select('teacher')}
		return render.student.teacher_all(web.ctx.session, 'teacher_all', data)

class TeacherInfo(User):
	def __init__(self):
		User.__init__(self)
	def GET(self, tid):
		data = db.select('teacher', dict(id=tid), where='id=$id')[0]
		return render.student.teacher_info(data)

class Info(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.student.info(web.ctx.session, 'student_info')

class Choose(User):
	def __init__(self):
		User.__init__(self)
	def GET(self, tid):
		r = db.select('teacher', dict(id=tid), where='id=$id', what='total, has', limit=1)[0]
		if(r.has >= r.total):
			return self.error('此导师名额已满，请返回选择其他导师')
		t = db.transaction()
		try:
			pre_st = db.select('student', where='id=%d'%(web.ctx.session.uid), what='st')[0].st
			if pre_st > 0:
				# delete previous teacher
				db.query("UPDATE st SET status='delete' where id = %d"%(pre_st))
				pre_teacher = db.select('st', where='id=%d'%(pre_st))[0].teacher
				db.query("UPDATE teacher SET has = has - 1 WHERE id = $id", vars={'id':pre_teacher})
			# choose new teacher
			db.query("UPDATE teacher SET has = has + 1 WHERE id = $id", vars={'id':tid})
			st_id = db.insert('st', student=web.ctx.session.uid, teacher=tid, status='wait')
			db.update('student', where='id=%d'%(web.ctx.session.uid), st=st_id)
		except Exception, e:
			print e
			t.rollback()
			return self.error('未知错误，请重试。')
		else:
			t.commit()
		web.seeother('/student/teacher/my')
	def del_previous():
		pass

class Delete(User):
	def __init__(self):
		User.__init__(self)
	def GET(self, tid):
		t = db.transaction()
		try:
			db.query("UPDATE teacher SET has = has - 1 WHERE id = $id", vars={'id':tid})
			st_id = db.select('st', dict(tid=tid), where='teacher=$tid',\
				order='time DESC', limit=1)[0].id
			db.query("UPDATE st SET status='delete' where id = %d"%(st_id))
			db.update('student', where='id=%d'%(web.ctx.session.uid), st=0)
		except Exception, e:
			t.rollback()
			return self.error('未知错误，请重试。')
		else:
			t.commit()
		web.seeother('/student/teacher/all')

		
