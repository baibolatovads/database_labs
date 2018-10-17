/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);

--Key Constraints:

ALTER TABLE Movie ADD PRIMARY KEY(mID); --1
ALTER TABLE Movie ADD UNIQUE(title, year); --2
ALTER TABLE Reviewer ADD PRIMARY KEY(rID); --3
ALTER TABLE Rating ADD UNIQUE(rID,mID,ratingDate); --4


--NOT-NULL Constraints:


ALTER TABLE Reviewer ALTER COLUMN name SET NOT NULL;
ALTER TABLE Rating ALTER COLUMN stars SET NOT NULL;

--Atribute-based Check Constraints
ALTER TABLE Movie ADD CONSTRAINT movie_year CHECK(year > 1900);
ALTER TABLE Rating ADD CONSTRAINT rating_star CHECK(stars >= 1 AND stars <= 5);
ALTER TABLE Rating ADD CONSTRAINT rating_date CHECK(ratingDate > '2000-01-01');

--Tuple-Based Check Constraints


/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');


 update Rating set mID = 109;
 update Movie set year = 1901 where director <> 'James Cameron';
 update Rating set stars = stars - 1;
 
ALTER TABLE Rating ADD FOREIGN KEY (rID) REFERENCES Reviewer(rID) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE Rating ADD FOREIGN KEY (mID) REFERENCES Movie(mID) ON DELETE CASCADE;

update Reviewer set rID = rID + 10;
update Movie set year = 1901 where director <> 'James Cameron';
delete from Reviewer where rID > 215;
delete from Movie where mID < 105;

SELECT sum(rID) FROM Rating WHERE rID IS NOT NULL;

