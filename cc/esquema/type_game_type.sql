BEGIN;
create type game_type_enum as enum ('Standard', 'Terminator', 'Assassin', 'Polymorphic', 'Doubles', 'Triples' ,'Quadruples');
create table type_game_type (
	game_type_id int,
	game_type game_type_enum,
	game_type_team bool,
	game_type_description text
);
insert into type_game_type values 
	(1,'Standard', false, 'In a standard game each player fends for himself and there is only one winner'),
	(2, 'Terminator', false, 'In a terminator game you get points for the players that you eliminate. When players are auto-kicked in a terminator game their troops remain on the map, and you can still get points (and spoils) from them if you eliminate the deadbeat before the game is over (otherwise their points are awarded to the game winner). However if a players troops are eliminated from the map by a non-player (for example, via killer neutral), then no points will be awarded for that players elimination.'),
	(3, 'Assassin', false, 'In an assassin game each player is assigned a secret target, designated in-game with a crosshairs next to the username. You win the game if your target is killed - whether it be by you or another player! When a player is auto-kicked in an assassin game, the game continues and whomever had the deadbeat now has to kill the deadbeats target'),
	(4, 'Polymorphic', false, 'Polymorphic games allow players to control more than 1 army. Play alternates between the different armies. This involves more complex gameplay decisions and can allow for games involving less luck, particularly compared to Standard 1v1 Games.'),
	(5, 'Doubles', true, 'Teammates are determined by the sequence of players, for example the first two players and second two players make up two teams in a doubles game. In team games, you can deploy on your teammates regions and reinforce to your teammates adjacent regions (but not through them). The score is calculated per team. When a player is auto-kicked in a team game, the first surviving teammate inherits the troops and spoils. In team games, zone bonuses must be held by a single player to have effect.'),
	(6, 'Triples', true, 'Teammates are determined by the sequence of players, for example the first two players and second two players make up two teams in a doubles game. In team games, you can deploy on your teammates regions and reinforce to your teammates adjacent regions (but not through them). The score is calculated per team. When a player is auto-kicked in a team game, the first surviving teammate inherits the troops and spoils. In team games, zone bonuses must be held by a single player to have effect.' ),
	(7, 'Quadruples', true, 'Teammates are determined by the sequence of players, for example the first two players and second two players make up two teams in a doubles game. In team games, you can deploy on your teammates regions and reinforce to your teammates adjacent regions (but not through them). The score is calculated per team. When a player is auto-kicked in a team game, the first surviving teammate inherits the troops and spoils. In team games, zone bonuses must be held by a single player to have effect.');
COMMIT;


