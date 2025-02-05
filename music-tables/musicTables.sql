.open musicTables.sqlite

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS artist;

CREATE TABLE artist(
  artistid    INTEGER PRIMARY KEY NOT NULL, 
  artistname  TEXT
);

CREATE TABLE track(
  trackid     INTEGER PRIMARY KEY NOT NULL, 
  trackname   TEXT, 
  trackartist INTEGER,
  FOREIGN KEY(trackartist) REFERENCES artist(artistid) ON UPDATE CASCADE
);

INSERT INTO artist
VALUES(1, 'Dean Martin'),
      (2, 'Frank Sinatra');

INSERT INTO track
VALUES(11, 'Song 1', 1),
      (12, 'Song 2', 1),
      (13, 'Song 3', 2);


INSERT INTO track VALUES(14, 'Mr. Bojangles', NULL);
INSERT INTO artist VALUES(3, 'Sammy Davis Jr.');
UPDATE track SET trackartist = 3 WHERE trackname = 'Mr. Bojangles';
INSERT INTO track VALUES(15, 'Boogie Woogie', 3);
-- DELETE FROM artist WHERE artistname = 'Frank Sinatra';

