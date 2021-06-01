Online game data set for PLOS ONE paper                              
"Faithfulness-boost effect: loyal teammate selection correlates with 
skill acquisition improvement in online games"                       
by Gustavo Landfried, Diego Fernandez Slezak, and Esteban Mocskos.   
                     January 2019                                    

[Download from Dryad](https://datadryad.org/stash/dataset/doi:10.5061/dryad.888gm50)

Brief description of Conquer Club Data Set. 
These instructions will get you a working copy of the dataset used in the already mentioned paper.
You would be able to setup your local database server and execute your queries.

	## Introduction
	
		We exploit the virtually infinite repository of human behavior available in Internet to study a relevant topic in anthropological science: how grouping strategies
		may affect learning.
		We analyze the impact of team play strategies in skill acquisition using a turn-based game where players can participate individually or in teams.
		We unveil a subtle but strong effect in skill acquisition based on the way teams are formed and maintained during time.
		“Faithfulness-boost effect” provides a skill boost during the first games that would only be acquired after thousands of games.
		The tendency to play games in teams is associated with a long-run skill improvement while playing loyally with the same teammate significantly accelerates short-run skill acquisition.
		
		Unlike the individual game nature of chess, at Conquer Club (inspired by the board game RISK) a variable amount of players can take part in each game, playing individually or in teams (Supplementary section ``Gameplay options'').
		In Conquer Club there is a strong incentive for collaboration: the results of the games are by teams.
		All the players of a team win or lose together.
		A player who is eliminated during a game can still end up winning if her teammates defeat the rest of the teams.
		Therefore, it is essential that teammates can coordinate their actions.
		In contrast to other platforms, there is no paid content, offering the same conditions for all players.
		There is no skill matching mechanism based on the probability of winning of the players.
		The platform has a ``Join a Game'' section, where all the players can see all the open games (Supplementary section ``Matchmaking'').
		A typical Conquer Club game environment has four relevant elements: 
		  - the current map with troops occupation in each region;
		  - the game status showing current round and a summary of players information;
		  - a public game chat;
		  - and a log of movements. 

	## Core Entity-Relation Diagram

		| GAME |--(many)------ | PLAY | ------(many)-- | PLAYER |

		### Main non-redundant attributes
			
			GAME
			* Game id (key)
			* Start time
			* Round limit

			PLAY
			* Game id (key)
			* Player id (key)
			* Team
			* Won
			* End time
			* Regions
			* Inscription order
			* Mean (estimated skill)
			* Std (uncertainty of the estimated skill)

			PLAYER
			* Player id (key)

	## Getting Started
	
		The backup file stored in DRYAD was created using PostgreSQL dump method. As this plain text file is large, it was compressed (using gzip) and separated (using split).
		To join the files, you should use command "cat".
		The idea behind this dump method is to generate a text file with SQL commands that, when fed back to the server, will recreate the database in the same state as it was at the time of the dump.
        PostgreSQL provides the utility program pg_dump for this purpose. 
        The basic usage of this command is:

		pg_dump dbname > backup_file

		### Prerequisites
		
        You will need a PostgreSQL version running in your local machine
		
		### Install
		
        The text files created by pg_dump are intended to be read in by the psql program.
        The general command form to restore a dump is:
			
        psql dbname < backup_file
			```
			
        The database dbname will not be created by this command, so you must create it yourself. 

	## Authors
	
		* **Gustavo Landfried 1,2  ** 
		* **Diego Fernández Slezak 1,2 ** 
		* **Esteban Mocskos 1,3 ** 
		
		1 Universidad de Buenos Aires. Facultad de Ciencias Exactas y Naturales.
		Departamento de Computación. Buenos Aires, Argentina
		2 CONICET-Universidad de Buenos Aires. Instituto de Investigación en Ciencias de la
		Computación (ICC). Buenos Aires, Argentina
		3 CONICET. Centro de Simulación Computacional p/Aplic Tecnológicas (CSC).
		Buenos Aires, Argentina

	## License
	
		The website allows any person, and not just registered participants, to explore the matches and browse their related data.
		Registered users are identified by their nicknames and, to be accepted as users, they have to agree with having their games stored in a publicly accessible server.
		Moreover, during the downloading process, each player is identified by an internal id number, anonymizing the data.
		In consequence, there is no need for individual consent due to this double layer of anonymity and the open nature of the website.
		We contacted Conquer Club' owners to get authorization for performing this process, thus complying with this site' terms of use.

	## Database details

		### Game

			CREATE TABLE game (
			    game_id integer NOT NULL,
			    map_id integer NOT NULL,
			    game_type game_type_enum NOT NULL,
			    initial_troops initial_troops_enum NOT NULL,
			    play_order play_order_enum NOT NULL,
			    spoils spoils_enum NOT NULL,
			    fog_of_war boolean NOT NULL,
			    trench_warfare boolean NOT NULL,
			    round_limit round_limit_enum NOT NULL,
			    round_length round_length_enum NOT NULL,
			    reinforcements reinforcements_enum NOT NULL,
			    rounds integer NOT NULL,
			    time_start timestamp without time zone,
			    joinability joinability_enum
			);

			 * game_id: primary key
			 * map_id: foreign key (tabla map) 
			 * game_type: 'Standard', 'Terminator', 'Assassin', 'Polymorphic', 'Doubles', 'Triples', 'Quadruples'
			 * initial_troops: 'Automatic', 'Manual'
			 * play_order: 'Sequential', 'Freestyle'
			 * spoils: 'Escalating', 'Flat Rate', 'Nuclear', 'Zombie', 'No Spoils'
			 * fog_of_war: masks enemy positions that are not adjacent
			 * trench_warfare: If False, if you conquer a region you can assault further from that region during the same turn. Is True, otherwise.
			 * reinforcements: 'Chained', 'Adjacent', 'Parachute', 'Unlimited', 'None'
			 * round_length: '24 Hours', '5 Minutes', '4 Minutes', '3 Minutes', '2 Minutes', '1 Minutes'
			 * round_limit: 'None', '20 Rounds', '30 Rounds', '50 Rounds', '100 Rounds'
			 * joinability: 'Public', 'Private', 'Tournament' 

		### Player		

			CREATE TABLE player (
			    player_id integer NOT NULL,
			    name text
			); 
		
			 * player_id: primary key
			 * name: the nick name
		
		### Play
		
			 CREATE TABLE play (
			    player_id integer NOT NULL,
			    game_id integer NOT NULL,
			    won boolean NOT NULL,
			    delta_points integer
			    game_over game_over_enum,
			    time_end timestamp without time zone,
			    spoils integer,
			    regions integer,
			    troops integer,
			    troops_due integer,
			    team integer NOT NULL,
			    inscription_order integer NOT NULL,
			    eliminated_by integer
			);
		
			
			 * player_id, game_id: primary key
			 * won: indicate if the player won or lost the game
			 * delta_points: Conquer Club point won/lost in the game
			 * game_over: {'Eliminated', 'Kicked out', 'Surrendered', 'Violating rules'}
			 * spoils, regions, troops, troops_due:  They contain the values at the end of the game
			 * team: indicates which team the player belongs to in this game
			 * inscription_order: indicates the order of inscription to the game
			 * eliminated_by: indicates the player who definitively eliminated this player from the game
		
		
	## Descriptive tables
	
		The descriptive tables were created to detail the meaning of certain attributes

		CREATE TABLE type_game_type (
		    game_type_id integer,
		    game_type game_type_enum,
		    game_type_team boolean,
		    game_type_description text
		);

		 CREATE TABLE type_game_over (
		    game_over_id integer,
		    game_over game_over_enum,
		    game_over_description text
		);

		CREATE TABLE type_play_order (
		    play_order_id integer,
		    play_order play_order_enum,
		    play_order_description text
		);

		CREATE TABLE type_initial_troops (
		    initial_troops_id integer,
		    initial_troops initial_troops_enum,
		    initial_troops_description text
		);

		 CREATE TABLE type_reinforcements (
		    reinforcements_id integer,
		    reinforcements reinforcements_enum,
		    reinforcements_description text
		);

		 CREATE TABLE type_round_length (
		    round_length_id integer,
		    round_length round_length_enum,
		    round_length_speed boolean,
		    round_length_description text
		);

		 CREATE TABLE type_round_limit (
		    round_limit_id integer,
		    round_limit round_limit_enum,
		    round_limit_description text
		);

		 CREATE TABLE type_spoils (
		    spoils_id integer,
		    spoils spoils_enum,
		    spoils_description text
		);

		 CREATE TABLE type_fog_of_war (
		    fog_of_war_id integer,
		    fog_of_war boolean,
		    fog_of_war_description text
		);

		 CREATE TABLE type_spoils (
		    spoils_id integer,
		    spoils spoils_enum,
		    spoils_description text
		);

		 CREATE TABLE type_joinability (
		    joinability_id integer,
		    joinability joinability_enum,
		    joinability_description text
		);

	## Other tables

		### Chat

			All games have a public chat.
			The public conversations are stored in the chat table.
			The variable "ord" indicates the order of appearance of the messages.

			 CREATE TABLE chat (
			    game_id integer NOT NULL,
			    "time" timestamp without time zone NOT NULL,
			    player_id integer NOT NULL,
			    text text,
			    ord integer NOT NULL
			);

		### Log

			All games have a public log.
			Each game has a log of activity of the players where are reported the territory conquest, the elimination of players and the incorporation of new troops among other movements.
			The log of all the games is stored in this table.
			The variable ord indicates the order of appearance of the messages.
			
			 CREATE TABLE _log (
			    ord integer NOT NULL,
			    game_id integer NOT NULL,
			    "time" timestamp without time zone NOT NULL,
			    text text NOT NULL
			);

		### Map

			There are about 200 maps.
			The table contains the name of the maps and the name of the xml file.

			CREATE TABLE map (
			    map_id integer NOT NULL,
			    name text,
			    xml text
			); 

		### Region

			List the regions that each map has	

			 CREATE TABLE region (
			    map_id integer NOT NULL,
			    region_id integer NOT NULL,
			    name text
			);

		 ### Border

			Indicates the boundaries between map regions

			 CREATE TABLE border (
			    map_id integer NOT NULL,
			    region_id_from integer NOT NULL,
			    region_id_to integer NOT NULL
			);
