create table edge (
	player_form integer references player(player_id),
	player_to integer references player(player_id),
	games_played integer,  
	game_id integer,
	time_start TIMESTAMP not null,
	teammates integer,
	primary key (player_form, player_to, games_played)
);
