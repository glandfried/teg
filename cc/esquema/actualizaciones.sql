CREATE PROCEDURE tabla_actualizaciones()
LANGUAGE SQL
AS $$
create table actualizaciones (
	id integer primary key ,
	time_first_game timestamp not null,
	first_game integer not null,
	time_last_game timestamp not null,
	end_game integer not null,
	time_actualizacion_start timestamp not null,
	time_actualizacion_end timestamp not null
);
$$;





