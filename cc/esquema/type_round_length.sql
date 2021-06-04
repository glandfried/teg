begin;
create type round_length_enum as enum ('24 Hours', '5 Min Minutes', '4 Min Minutes','3 Min Minutes','2 Min Minutes', '1 Min Minutes');
create table type_round_length (
	round_length_id int,
	round_length round_length_enum,
	round_length_speed bool,
	round_length_description text
);
insert into type_round_length values 
	(1,'24 Hours', false, ''),
	(2,'5 Min Minutes',true, 'These real-time games automatically refresh and an extra 2.5 minutes is added to the round length when someone is eliminated. Such games are listed under the "Speed Games" section of "Join A Game" until it fills up. If a player logouts or their session is idle for more than 15 minutes they will be automatically dropped from any waiting speed games.'),
	(3,'4 Min Minutes',true,'These real-time games automatically refresh and an extra 2.5 minutes is added to the round length when someone is eliminated. Such games are listed under the "Speed Games" section of "Join A Game" until it fills up. If a player logouts or their session is idle for more than 15 minutes they will be automatically dropped from any waiting speed games.'),
	(4,'3 Min Minutes',true,'These real-time games automatically refresh and an extra 2.5 minutes is added to the round length when someone is eliminated. Such games are listed under the "Speed Games" section of "Join A Game" until it fills up. If a player logouts or their session is idle for more than 15 minutes they will be automatically dropped from any waiting speed games.'),
	(5,'2 Min Minutes',true,'These real-time games automatically refresh and an extra 2.5 minutes is added to the round length when someone is eliminated. Such games are listed under the "Speed Games" section of "Join A Game" until it fills up. If a player logouts or their session is idle for more than 15 minutes they will be automatically dropped from any waiting speed games.'),
	(6,'1 Min Minutes',true,'These real-time games automatically refresh and an extra 2.5 minutes is added to the round length when someone is eliminated. Such games are listed under the "Speed Games" section of "Join A Game" until it fills up. If a player logouts or their session is idle for more than 15 minutes they will be automatically dropped from any waiting speed games.');
commit;
