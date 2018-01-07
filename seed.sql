DROP DATABASE constellations;

CREATE DATABASE constellations;

DROP TABLE IF EXISTS star;

CREATE TABLE star (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  info TEXT,
  image TEXT

);

INSERT INTO star (title, info, image) values ('Libra', 'A constellation of the zodiac. Its name is Latin for weighing scales, and its symbol is. It is fairly faint, with no first magnitude stars, and lies between Virgo to the west and Scorpius to the east.', 'https://upload.wikimedia.org/wikipedia/commons/3/35/LibraCC.jpg');

insert into star (title, info, image) values ('Taurus', 'Taurus is one of the constellations of the zodiac, which means it is crossed by the plane of the ecliptic. Taurus is a large and prominent constellation in the northern hemisphere''s winter sky.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/TaurusCC.jpg/256px-TaurusCC.jpg')
