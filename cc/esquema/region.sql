create table region (
	map_id integer references map(map_id),
	region_id integer,
	primary key (map_id, region_id)
);
