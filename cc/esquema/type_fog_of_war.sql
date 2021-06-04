begin;
create table type_fog_of_war (
	fog_of_war_id int,
	fog_of_war bool,
	fog_of_war_description text
);
insert into type_fog_of_war values 
	(0,false,''),
	(1,true,'The fog of war masks enemy positions that are not adjacent to your forces (or your teams forces). It also masks region and zone names in the log.');
commit;
