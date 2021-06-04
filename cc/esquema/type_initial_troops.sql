begin;
create type initial_troops_enum as enum ('Automatic', 'Manual' );
create table type_initial_troops (
	initial_troops_id int,
	initial_troops initial_troops_enum,
	initial_troops_description text
);
insert into type_initial_troops values 
	(1,'Automatic', 'With automatic initial troops, each region is initially populated with 3 troops.'),
	(2,'Manual', 'With manual initial troops, each region is initially populated with 1 troop and during the first round of the game players deploy the rest wherever they see fit. During this first round, you cannot see your opponents deployments and all players can play simultaneously. When players miss the first round their armies are automatically deployed evenly.');
commit;
