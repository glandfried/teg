all: gamesdb.sql.dump

gamesdb.sql.dump: xaa
	gunzip gamesdb.gz
	mv gamesdb gamesdb.sql.dump

xaa:
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xaa
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xab
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xac
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xad
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xae
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xaf
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xag
	wget https://github.com/glandfried/teg/releases/download/v0.0.0/xah
	cat xaa xab xac xad xae xaf xag xah > gamesdb.gz
