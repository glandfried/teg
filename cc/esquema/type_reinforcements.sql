begin;
create type reinforcements_enum as enum ('Chained','Adjacent', 'Parachute', 'Unlimited', 'None');
create table type_reinforcements (
	reinforcements_id int,
	reinforcements reinforcements_enum,
	reinforcements_description text
);
insert into type_reinforcements values 
	(1,'Chained','you can reinforce once and from a region connected by regions you own.'),
	(2,'Adjacent','you can reinforce once and only from a direct neighbour. This requires you to plan your deployment and advances more carefully'), 
	(3,'Parachute','you can reinforce once from any territory you own to any other territory you own. This can give you the element of surprise if used wisely!'),
	(4,'Unlimited','you can reinforce as many times as you like from regions connected by regions you own. This makes the game easier and more flexible.'),
	(5,'None', 'you cannot reinforce at all');
commit;
