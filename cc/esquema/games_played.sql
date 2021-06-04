update play
set games_played = t1.games_played
from (
	SELECT pg.player_id, g.game_id, g.time_start, row_number() over (partition by pg.player_id order by g.time_start)AS games_played
	FROM play pg
	inner join game g
	on pg.game_id = g.game_id
	inner join temp_no_activos a
	on pg.player_id = a.player_id
	where g.time_start is not null
	
) t1
where play.game_id = t1.game_id and t1.player_id = play.player_id ;


CREATE TABLE temp_activos AS
SELECT player_id
from play
group by player_id
having count(*)>=100;	


CREATE TABLE temp_no_activos AS
SELECT player_id
from play
group by player_id
having count(*)<100;	

