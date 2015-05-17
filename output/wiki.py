# -*- coding: utf-8 -*-

import pycurl
import certifi
from io import BytesIO
from bs4 import BeautifulSoup
import json
import sys
import time
import psycopg2
import codecs

reload(sys)
sys.setdefaultencoding("utf-8")
sys.stdout = codecs.getwriter("utf-8")(sys.stdout)

f_in	= codecs.open('estructuras.csv', 'rb')
f_out	= codecs.open('o8_estructura.csv', 'wb')

lines	= []
with f_in as f :
	lines	= f.readlines()

pos 	= 0

while pos < len(lines):
	try :
		line	= lines[pos]
		line	= line.strip()

		l		= line.split('|')

		curl 	= pycurl.Curl()
		curl.setopt(pycurl.USERAGENT, "Mozilla/5.0 (compatible;  MSIE 7.01; Windows NT 5.0)")
		data	= BytesIO()

		'''
		id		= l[0]
		nombre	= l[1]
		id_wiki	= l[2]
		direcc	= l[3].replace('\"', '')
		'''
		wiki_id		= l[0]
		nombre		= l[1]

		key		= "EDC6FDF2-E7EFBEFE-C9C434D2-E19BB6FC-16C90065-6CB02E44-ED10C560-DFAC2F70" 
		path	= "http://api.wikimapia.org/?function=place.getbyid&key=%s&id=%s&format=json"

		print "%d %s %s" % (pos, wiki_id, nombre)

		print path % (key, wiki_id)

		curl.setopt(pycurl.URL, path % (key, wiki_id))
		curl.setopt(curl.WRITEFUNCTION, data.write)
		curl.perform()


		json_data	= data.getvalue()
		#print json_data
		#print '------------------------------------------------------------------------------'
		data	 	= json.loads(json_data)

		#print "aqui"
		#print data["polygon"]
		l_pol		= []

		for val in data["polygon"]:
			#print val
			l_pol.append("%s %s" % (val["x"], val["y"]))

		l_pol.append(l_pol[0])
		wkt			= "POLYGON ((" + ",".join(l_pol) + "))"

		f_out.write("%s|%s|SRID=4326;%s\n" % (wiki_id, nombre, wkt))
		

		pos	= pos + 1

	except:
		print 'DE NUEVO A LA CARGA'
		print sys.exc_info()[0]
		time.sleep(5)

f_out.close()
