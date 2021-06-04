begin;
create type spoils_enum as enum ('Escalating', 'Flat Rate', 'Nuclear', 'Zombie', 'No Spoils');
create table type_spoils (
	spoils_id int,
	spoils spoils_enum,
	spoils_description text
);
insert into type_spoils values 
	(1, 'Escalating', 'Escalating sets are worth 4,6,8,10,12,15,20... (i.e. the first set of spoils turned in by any player is worth 4 troops, the second set is worth 6, etc.) When the value reaches 100, it begins to escalate even more rapidly via the sequence 100,110,125,145,170...'),
	(2, 'Flat Rate', 'Flat Rate sets are worth 4 for red, 6 for green, 8 for blue and 10 for mixed.'),
	(3, 'Nuclear', 'Nuclear sets are not worth any troops. Instead, each region in the set is nuked to a single neutral troop (even if you own it!).'), 
	(4, 'Zombie', ' Zombie sets work in a similar way to Nuclear, with each region in the set being zombified to being neutral (but not changed in size). '),
	(5, 'No Spoils', '');
commit;
