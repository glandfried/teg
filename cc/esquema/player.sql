begin;
create table player (
	player_id integer primary key,
	name text,
	mean double precision, 
	std double precision, 
	last_time timestamp,
	last_game_id integer
); 
insert into player (0, 'neutral');
commit;
alter table player add column fisrt_time timestamp;



