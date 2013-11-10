import web
# -*- coding: utf-8 -*- 
#db = web.database(dbn='mysql', db='www', user='www', pw='www')

render = web.template.render('templates/', cache=False)
#db = web.database(dbn='sqlite', db='db/testdb')
db = web.database(dbn='mysql', db='select', user='root', pw='root')


web.config.debug = True

config = web.storage(
	email='aa.com',
	site_name = U"SELECT",
	site_desc = '',
	static = '/static',
)


web.template.Template.globals['config'] = config
web.template.Template.globals['render'] = render
# web.template.Template.globals['cxt'] = web.ext


