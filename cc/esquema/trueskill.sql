create table trueskill (
	game_id integer,-- references game(game_id),
	player_id integer,-- references player(player_id),
	ord int, 
	mu double precision,
	sigma double precision--,
	--primary key (game_id, player_id),
	--foreign key (game_id, player_id) references play(game_id, region_id)
);
