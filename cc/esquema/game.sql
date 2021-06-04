create table game (
	game_id integer primary key,
	map_id int not null,
	game_type game_type_enum not null,
	initial_troops initial_troops_enum not null,
	play_order play_order_enum not null,
	spoils spoils_enum not null,
	fog_of_war bool not null,
	trench_warfare bool not null,
	round_limit round_limit_enum not null,
	round_length round_length_enum not null,
	reinforcements reinforcements_enum not null,
	players int not null, 
	rounds int not null, 
	time_start TIMESTAMP not null, 
	joinability joinability_enum,
	slots_per_player int
);

