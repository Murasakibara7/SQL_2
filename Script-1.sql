
create table if not exists Genre (
	id SERIAL primary key,
	name VARCHAR(40) not null
);



create table if not exists Band (
	id serial primary key,
	name VARCHAR(40) not NULL
);



create table if not exists GenreBand (
	Genre_id INTEGER references Genre(id),
	Band_id INTEGER references Bands(id),
	constraint pk_GenreBand primary key (Genre_id, Band_id)
);



create table if not exists Albums (
	id SERIAL PRIMARY key,
	name VARCHAR(40) unique not null,
	year_of INTEGER check(year_of>2000)
);



create table if not exists BandAlbums (
	Albums_id INTEGER references Albums(id),
	Band_id INTEGER references Band(id),
	constraint pk_BandAlbums primary key (Albums_id, Band_id)
);



create table if not exists Track (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	duration INTEGER,
	Albums_id INTEGER references Albums(id)
);



create table if not exists Collection (
	id SERIAL primary key,
	name VARCHAR(40) unique not null,
	year_of INTEGER check(year_of>2000)
);



create table if not exists TrackCollection (
Track_id INTEGER references Track(id),
Collection_id INTEGER references Collection(id),
constraint pk_TrackCollection primary key (Track_id, Collection_id)
);