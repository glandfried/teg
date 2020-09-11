select g.game_id
,g.time_start
,pg.player_id 
,pg.won
,pg.team, pg.time_end 
from play pg  
inner join game g
on pg.game_id = g.game_id
where (g.time_start > '2006-01-01' and g.time_start < '2010-01-01')
order by g.time_start, g.game_id, pg.team 
