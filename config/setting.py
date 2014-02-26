# -*- coding: utf-8 -*- 
import web

# render = web.template.render('/var/www/stu-select/templates/', cache=False)
# db = web.database(dbn='sqlite', db='/var/www/stu-select/db/testdb')

# db = web.database(dbn='mysql', db='stu_select', user='root', pw='root')

web.config.debug = False

config = web.storage(
	site_name = U"本科生导师互选系统",
	site_desc = '本科生导师互选系统',
	email='gardeniaxy@gmail.com',
	root = '',
	refer = '/',
	# 使用本地static资源
	# static = '/static',
	# 使用'qiniu'云存储资源
	static = 'http://cs-mentor.qiniudn.com',
	app_name = 'mentor',
	# 年级
	grade = '1',
)

default_photo_url = '/static/img/avatar.png'

# web.template.Template.globals['config'] = config
# web.template.Template.globals['render'] = render
# web.template.Template.globals['cxt'] = web.ext


