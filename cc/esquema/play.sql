create table play (
	player_id integer references player(player_id),
	game_id integer references game(game_id),
	won bool not null,
	delta_points int , 
	game_over game_over_enum,
	time_end timestamp not null, 
	spoils int,
	regions int,
	troops int,
	troops_due int,
	team int not null,
	inscription_order int not null,
	eliminated bool, 
	eliminated_by integer references player(player_id),
	points int, 
	primary key(player_id, game_id)
);	

ALTER TABLE play
ADD games_played int;

ALTER TABLE play
ADD mu_ts float;
ALTER TABLE play
ADD sigma_ts float;
ALTER TABLE play
ADD mu_ttt float;
ALTER TABLE play
ADD sigma_ttt float;
