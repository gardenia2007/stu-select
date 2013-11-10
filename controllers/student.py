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
		return render.student.teacher_my(web.ctx.session, 'teacher_my')

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
	def GET(self):
		# choose teacher should as a TRANSMIT

		web.seeother('/student/teacher/my')
