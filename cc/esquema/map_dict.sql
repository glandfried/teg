create table map_dict (
	map_id integer primary key references map(map_id),
	dict text
);
