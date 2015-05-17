COPY TIPO_VIA(ID, NOMBRE) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o1_tipovia.csv' WITH CSV HEADER DELIMITER '|';
COPY VIA(ID, NOMBRE, TIPO_VIA_ID) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o2_via.csv' WITH CSV HEADER DELIMITER '|';
COPY NODO(ID, LONGITUD, LATITUD, GEOM) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o3_nodo.csv' WITH CSV HEADER DELIMITER '|';
COPY PISTA(ID, ID_NODO_ORIGEN, ID_NODO_DESTINO, VIA_ID, DISTANCIA, GEOM) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o4_arista.csv' WITH CSV HEADER DELIMITER '|';
COPY TIPO_ESTRUCTURA(ID, NOMBRE, DESCRIPCION) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o5_tipo_estructura.csv' WITH CSV HEADER DELIMITER '|';
COPY ESTRUCTURA(ID, NOMBRE, GEOM) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o8_estructura.csv' WITH CSV HEADER DELIMITER '|';
COPY TIPO_INCIDENTE(ID, NOMBRE, DESCRIPCION) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o6_tipo_incidente.csv' WITH CSV HEADER DELIMITER '|';
COPY TIPO_OBRA(ID, NOMBRE, DESCRIPCION) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o7_tipo_obra.csv' WITH CSV HEADER DELIMITER '|';
COPY OBRA(TIPO_OBRA_ID, NOMBRE, DESCRIPCION, GEOM, VIA_ID, FECHA_INICIO, FECHA_FIN) FROM 'C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\o9_obra.csv' WITH CSV HEADER DELIMITER '|';



C:\Users\pamor213\Documents\GitHub\hackaton-miraflores\output\
