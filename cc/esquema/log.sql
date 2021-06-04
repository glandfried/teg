create table _log (
	ord integer, 
	game_id integer references game(game_id),
	time timestamp not null,
	text text not null,
	primary key (ord, game_id) 
); 
