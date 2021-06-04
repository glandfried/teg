begin;
create type game_over_enum as enum ('Eliminated','Kicked out','Surrendered');
create table type_game_over (
	game_over_id int,
	game_over game_over_enum,
	game_over_description text
);
insert into type_game_over values 
	(1,'Eliminated','All troops where killed'),
	(2,'Kicked out','Miss 3 turns'), 
	(3,'Surrendered','Old option');
ALTER TYPE game_over_enum ADD value 'Violating rules'; -- appends to list
insert into type_game_over values 
	(4,'Violating rules','Kicked out for violating the rules');

commit;
