begin;
create type round_limit_enum as enum ('None', '20 Rounds', '30 Rounds', '50 Rounds', '100 Rounds');
create table type_round_limit (
	round_limit_id int,
	round_limit round_limit_enum,
	round_limit_description text
);
insert into type_round_limit values 
	(1, 'None', ''),
	(2, '20 Rounds', 'With round limits, the game will automatically finish at the end of the specified round. The winner will be the surviving player with the most troops. If there is a tie, it will be broken based on the most regions. If there is still a tie, the winner is selected based on join order. When playing a round limited game with teams, the winning team will be based on combined teamwide troop count. This option is great for avoiding stalemates and can add some spice to the game as the deadline approaches!'),
	(3, '30 Rounds','With round limits, the game will automatically finish at the end of the specified round. The winner will be the surviving player with the most troops. If there is a tie, it will be broken based on the most regions. If there is still a tie, the winner is selected based on join order. When playing a round limited game with teams, the winning team will be based on combined teamwide troop count. This option is great for avoiding stalemates and can add some spice to the game as the deadline approaches!' ),
	(4, '50 Rounds', 'With round limits, the game will automatically finish at the end of the specified round. The winner will be the surviving player with the most troops. If there is a tie, it will be broken based on the most regions. If there is still a tie, the winner is selected based on join order. When playing a round limited game with teams, the winning team will be based on combined teamwide troop count. This option is great for avoiding stalemates and can add some spice to the game as the deadline approaches!'),
	(5, '100 Rounds','With round limits, the game will automatically finish at the end of the specified round. The winner will be the surviving player with the most troops. If there is a tie, it will be broken based on the most regions. If there is still a tie, the winner is selected based on join order. When playing a round limited game with teams, the winning team will be based on combined teamwide troop count. This option is great for avoiding stalemates and can add some spice to the game as the deadline approaches!');
commit;
