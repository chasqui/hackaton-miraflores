#!/bin/bash

osmosis --rb file=peru.pbf --bounding-polygon file=miraflores.poly --way-key-value keyValueList=highway.primary,highway.secondary,highway.tertiary,highway.trunk,highway.motorway,highway.residential,highway.motorway_link,highway.trunk_link,highway.primary_link,highway.secondary_link,highway.tertiary_link --write-xml miraflores.osm

psql -U postgres -f pgrouting_esquema.sql

osm2pgrouting -file miraflores.osm -conf mapconfig.xml -dbname pgrouting-workshop -user postgres -clean
osm2pgrouting -file miraflores.osm -conf mapconfig.xml -dbname pgrouting-workshop -user postgres -clean

