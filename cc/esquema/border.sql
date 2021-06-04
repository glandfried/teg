create table border (
	map_id integer,
	region_id_from integer,
	region_id_to integer,
	primary key (map_id, region_id_from, region_id_to),
	foreign key (map_id, region_id_from) references region(map_id, region_id),
	foreign key (map_id, region_id_to) references region(map_id, region_id)
);
