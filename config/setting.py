import web
# -*- coding: utf-8 -*- 

render = web.template.render('templates/', cache=False)
#db = web.database(dbn='sqlite', db='db/testdb')
db = web.database(dbn='mysql', db='select', user='root', pw='root')

web.config.debug = False

config = web.storage(
	site_name = U"本科生导师互选系统",
	site_desc = '本科生导师互选系统',
	email='gardeniaxy@gmail.com',
	root = '/select',
	static = '/select/static',
	# 年级
	grade = '1',
)

default_photo_url = '/static/img/avatar.png'

web.template.Template.globals['config'] = config
web.template.Template.globals['render'] = render
# web.template.Template.globals['cxt'] = web.ext


