begin;
create type joinability_enum as enum ('Public','Private','Tournament');
create table type_joinability (
	joinability_id int,
	joinability joinability_enum,
	joinability_description text
);
insert into type_joinability values 
	(1,'Public',''),
	(2,'Private','To play with a select group of people, the game creator may specify a private password and pass it out as desired. Such a game is listed under the "Private Games" section of "Join A Game" until either it fills up or 30 days have passed, at which point it will be deleted automatically.'),
	(3,'Tournament','These are games belonging to a community-run or system-run tournament. They are created by members with special tournament game privileges, or by the Conquer Club system itself. Such a game is listed under the "Tournament Games" section of "Join A Game" until either it fills up or 15 days have passed, at which point it will be deleted automatically. To participate in a tournament, go to the Join A Tournament page. To read all the rules and procedures for tournaments or for assistance in starting your own, please consult the Conquer Club Tournament Handbook.');
commit;
