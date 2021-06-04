begin;
create type play_order_enum as enum ('Sequential', 'Freestyle');
create table type_play_order (
	play_order_id int,
	play_order play_order_enum,
	play_order_description text
);
insert into type_play_order values 
	(1,'Sequential', 'In a sequential game player 1 is first, then player 2, then player 3, etc. Sequential games are slower but straightforward. When playing a sequential game with teams the order is staggered, alternating between teams. '),
	(2, 'Freestyle', 'In a freestyle game it doesnt matter in which order players take their turns. Players can even play simultaneously! After the last player takes his turn, a new round begins immediately. To keep things fair, the last player (or team) to end their turn in each round is blocked from taking a second back-to-back turn and must wait until either an opponent begins their turn or half of the round passes.' );
commit;
