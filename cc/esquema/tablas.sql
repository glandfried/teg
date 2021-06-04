create table fuente_mapa (
  idmapa int references mapa (id),
  info_mapa varchar(100000),	
  primary key (idmapa)
);

create table mapa (
  id int primary key, 
  nombre varchar(32) not null,
  position_max int, 
  min_reinforcements int
  lower int not null,
  upper int not null,
  divisor int not null,
);
--max positions

create table reinforcement (
  idmapa int references mapa (id),
  id int, 

  primary key (idmapa, id)
);

create table territorio (
 idmapa int references mapa (id),  
 id int,
 nombre varchar(32) not null, 
 bonus int not null,
 neutral int not null,
 nuetralkiller boolean not null CHECK ((neutralkiller and neutral > 0) or (not neutralkiller and neutral=0) , 
 --idinitpos int, 
 primary key(idmapa, id)
);
--alter table territorio add column idinitpos int references initialposition (id)


create table continente (
 idmapa int references mapa (id),  
 id int, 
 nombre varchar(32) not null, 
 bonus int not null,
 required int,
 primary key(idmapa, id)
);

create table initialposition (
  idmapa int references mapa (id),
  id int,
  max int,
  primary key (idmapa,id)
);

create table bonuses(
  idmapa int references mapa (id),
  idcont int, 
  required int,
  bonus int not null,
  primary key(idmapa,idcont,required),
  FOREIGN KEY (idmapa, idcont) REFERENCES continente (idmapa, id)
);

create table compuesto (
 idmapa int references mapa (id),
 idcont int,
 idterr int,
 primary key(idmapa, idcont, idterr),
 FOREIGN KEY (idmapa, idcont) REFERENCES continente (idmapa, id),
 FOREIGN KEY (idmapa, idterr) REFERENCES territorio (idmapa, id)
);

create table borde (
 idmapa int references mapa (id),
 id_de int,
 id_a int,
 primary key(idmapa, id_de, id_a),
 FOREIGN KEY (idmapa, id_de) REFERENCES territorio (idmapa, id),
 FOREIGN KEY (idmapa, id_a) REFERENCES territorio (idmapa, id)
);

create table bomba (
 idmapa int references mapa (id),
 id_de int,
 id_a int,
 primary key(idmapa, id_de, id_a),
 FOREIGN KEY (idmapa, id_de) REFERENCES territorio (idmapa, id),
 FOREIGN KEY (idmapa, id_a) REFERENCES territorio (idmapa, id)
);

create table subcontinente (
 idmapa int references mapa (id),
 id_de int,
 id_a int,
 primary key(idmapa, id_de, id_a),
 FOREIGN KEY (idmapa, id_de) REFERENCES continente (idmapa, id),
 FOREIGN KEY (idmapa, id_a) REFERENCES continente (idmapa, id)
);  

create table override (
 idmapa int references mapa (id),
 id_de int,
 id_a int,
 primary key(idmapa, id_de, id_a),
 FOREIGN KEY (idmapa, id_de) REFERENCES continente (idmapa, id),
 FOREIGN KEY (idmapa, id_a) REFERENCES continente (idmapa, id)
);


create type tipo_objetivo as enum ('ganar','vivir');

create table objetivo (
  idmapa int references mapa (id),
  id int,
  nombre varchar(32) not null,
  requiere int, 
  tipo tipo_objetivo not null,
  primary key(idmapa, id)
);

create table objetivo_territorio (
 idmapa int references mapa (id),
 idobj int,
 idterr int,
 primary key(idmapa, idobj, idterr),
 FOREIGN KEY (idmapa, idobj) REFERENCES objetivo (idmapa, id),
 FOREIGN KEY (idmapa, idterr) REFERENCES territorio (idmapa, id)
);

create table objetivo_continente (
 idmapa int references mapa (id),
 idobj int,
 idcont int,
 primary key(idmapa, idobj, idcont),
 FOREIGN KEY (idmapa, idobj) REFERENCES objetivo (idmapa, id),
 FOREIGN KEY (idmapa, idcont) REFERENCES continente (idmapa, id)
);

