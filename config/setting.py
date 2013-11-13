import web
# -*- coding: utf-8 -*- 
#db = web.database(dbn='mysql', db='www', user='www', pw='www')

render = web.template.render('templates/', cache=False)
#db = web.database(dbn='sqlite', db='db/testdb')
db = web.database(dbn='mysql', db='select', user='root', pw='root')

web.config.debug = True

config = web.storage(
	email='gardeniaxy@gmail.com',
	site_name = U"本科生导师互选系统",
	site_desc = '本科生导师互选系统',
	static = '/static',
)

default_photo_url = '/static/img/avatar.png'

web.template.Template.globals['config'] = config
web.template.Template.globals['render'] = render
# web.template.Template.globals['cxt'] = web.ext


