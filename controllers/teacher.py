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
		raise web.seeother('/student/info')
	def POST(self):
		pass

class Student_my(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.teacher.student_my(web.ctx.session)

class Teacher_all(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.student.teacher_all(web.ctx.session)

class Student_info(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.teacher.student_info()


class Info(User):
	def __init__(self):
		User.__init__(self)
	def GET(self):
		return render.teacher.info(web.ctx.session)
		
