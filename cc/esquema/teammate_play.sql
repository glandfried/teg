create table teammate_play (
	player_id_1 int references player(player_id) 
	,player_id_2 int references player(player_id)
	,game_id int references game(game_id)
	,mu float
	,sigma float
	,mu_old float
	,sigma_old float
	,games_played int
	,primary key (game_id, player_id_1, player_id_2)
	,CONSTRAINT valid_id CHECK (player_id_1 < player_id_2)
);

