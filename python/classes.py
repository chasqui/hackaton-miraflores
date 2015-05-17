class Shapefile :
	wkt		= ""
	refname = ""
	id		= ""
	area	= ""
	id_orig = ""
	area_1_ = ""
	zoneseg	= ""
	trafficzon  = ""
	landuse		= ""
	distrito	= ""
	zconbine15	= ""
	zconbine14	= ""
	region		= ""
	zona553		= ""
	zona553com 	= ""
	zona638emu	= ""
	dist		= ""
	centroide	= ""
	destautohp	= ""
	destpubhpm	= ""

	def __init__(self, row) :
		self.wkt		= row[0]
		self.refname 	= row[1]
		self.id			= row[2]
		self.area		= row[3]
		self.id_orig 	= row[4]
		self.area_1_ 	= row[5]
		self.zoneseg	= row[6]
		self.trafficzon = row[7]
		self.landuse	= row[8]
		self.distrito	= row[9]
		self.zconbine15	= row[10]
		self.zconbine14	= row[11]
		self.region		= row[12]
		self.zona553	= row[13]
		self.zona553com = row[14]
		self.zona638emu	= row[15]
		self.dist		= row[16]
		self.centroide	= row[17]
		self.destautohp	= row[18]
		self.destpubhpm	= row[19]

class Nodo :
	idnodo	 	= ""
	latitud		= ""
	longitud	= ""
	
	def __init__(self, row = None) :
		if row is not None :
			self.idnodo 	= str(row[0])
			self.longitud 	= str(row[1])
			self.latitud 	= str(row[2])

	def guardar(self, file) :
		cad     = "%s|%s|%s|SRID=4326;POINT(%s %s)\n"%(self.idnodo, self.longitud, self.latitud, self.longitud, self.latitud)
		file.write(cad)

class Tipo_Via :
	idtipovia 	= ""
	nombretipo	= ""

	def __init__(self, row) :
		self.idtipovia 	= str(row[0])
		self.nombretipo = str(row[1])

	def guardar(self, file) :
		cad	= "%s|%s\n"%(self.idtipovia, self.nombretipo)
		file.write(cad)

class Via :
	idvia			= ""
	nombre			= ""
	idtipovia		= ""

	def __init__(self, row) :
		self.idvia 			= str(row[0])
		self.nombre 		= str(row[1]).strip()
		self.idtipovia		= str(row[2])

	def guardar(self, file) :
		cad = "%s|%s|%s\n"%(self.idvia, self.nombre, self.idtipovia)
		file.write(cad)

class Arista :
	idarista		= ""
	idnodoorigen	= ""
	idnododestino	= ""
	idvia			= ""
	distancia		= ""
	geom			= ""

	def __init__(self, row = None) :
		if row is not None :
			self.idarista 		= str(row[0])
			self.idnodoorigen 	= str(row[1])
			self.idnododestino 	= str(row[2])
			self.idvia	 		= str(row[3])
			self.distancia 		= str(row[4])
			self.geom 			= str(row[5])

	def guardar(self, file) :
		cad = "%s|%s|%s|%s|%s|%s\n"%(self.idarista, self.idnodoorigen, self.idnododestino, self.idvia, self.distancia, self.geom)
		file.write(cad)


