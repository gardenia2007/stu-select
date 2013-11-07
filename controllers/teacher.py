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
		raise web.seeother('/teacher/student/my')
	def POST(self):
		pass

class StudentMy(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.teacher.student_my(web.ctx.session, 'student_my')

class TeacherAll(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.student.teacher_all(web.ctx.session, 'teacher_all')

class StudentInfo(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.teacher.student_info()


class Info(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.teacher.info(web.ctx.session, 'teacher_info')
		
