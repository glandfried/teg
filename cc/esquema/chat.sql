create table chat (
	game_id integer references game(game_id), 
	time timestamp,	
	player_id integer references player(player_id),
	text text,
	primary key (game_id, player_id, time)
);

select * 
from chat 
order by time




UPDATE chat 
SET ord=sq.rnum
FROM (
	SELECT game_id, time, player_id, row_number() OVER (PARTITION BY game_id ORDER BY time) AS rnum
	from chat 
	order by game_id, time 
) AS sq
WHERE chat.game_id=sq.game_id and
	chat.time = sq.time and
	chat.player_id = sq.player_id;
