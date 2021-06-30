copy (
with outcome as (
 select g.game_id, g.time_start, pg.team, pg.team_result,
 translate(array_agg(pg.player_id)::text,'{}','[]') as comp,
 max(pg.won::int) as won,
 max(pg.time_end) as time,
 max(pg.regions) as regions,
 max(pg.troops) as troops
 from play pg
 inner join game g
 on pg.game_id = g.game_id
 where (g.time_start > '2006-01-01' and g.time_start < '2010-01-01')
 group by g.game_id, g.time_start, pg.team, pg.team_result
),
res as (
select *, row_number() over (partition by o.game_id order by o.won, o.time, o.regions, o.troops asc) as r
from outcome o
)
select o.game_id, o.time_start, o.team_result
translate(array_agg(o.comp order by o.won, o.time, o.regions, o.troops asc)::text, '{}','[]') as result, 
translate(array_agg(o.r order by o.won, o.time, o.regions, o.troops asc)::text, '{}','[]') as orden,
translate(array_agg(o.won order by o.won, o.time, o.regions, o.troops asc)::text, '{}','[]') as control1,
translate(array_agg(o.time order by o.won, o.time, o.regions, o.troops asc)::text, '{}','[]') as control2
from res as o
group by o.game_id, o.time_start
order by o.time_start, o.game_id asc
) To '/tmp/cc_outcome.csv' 
With CSV DELIMITER ',' HEADER;
