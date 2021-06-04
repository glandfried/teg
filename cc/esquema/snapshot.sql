create table snapshot (
	game_id integer references game(game_id),
	ord int, --el ultimo es 0. 
	map_id integer,	
	region_id integer,
	time timestamp,
	player_id integer references player(player_id), 
	troops_min integer,
	troops_max integer,
	primary key (game_id, region_id, ord),
	foreign key (map_id, region_id) references region(map_id, region_id)
);
