begin;
create table type_trench_warfare (
	trench_warfare_id int,
	trench_warfare bool,
	trench_warfare_description text
);
insert into type_trench_warfare values 
	(0,false,'If you conquer a region you can assault further from that region during the same turn.'),
	(1,true,'With trench warfare you can only assault from regions held continuously since the start of your turn. If you conquer a region (or re-conquer a region) you cannot assault further from that region during the same turn. The one exception being "killer neutrals" (explained on the Gameplay Notes page) from which you may continue assaulting. The game no longer involves steamrolling across the board. Instead you gradually advance your front!');
commit;
