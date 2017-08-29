-- Query all of the entries in the Genre table
--------------EXAMPLE------------------
-- SELECT column1, column2, ...
-- FROM table_name;

SELECT GenreId, Label
FROM genre
---------------------------------------------
-- Using the INSERT statement, add one of your favorite artists to the Artist table.
---------EXAMPLE----------------------------
-- insert into "tablename"
--  (first_column,...last_column)
--   values (first_value,...last_value);

insert into "Artist"
(ArtistId, ArtistName, YearEstablished)
values (29, 'Streetlight Manifesto', 1999);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

insert into "Album"
(AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
values (25, 'Somewhere in the Between', 2007, 120, 'Def Jam', 29, 4);

-- Using the INSERT statement, add some songs that are on that album to the Song table.

insert into "Song"
(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
values (22, 'The Blonde leading the Blind', 456, 2007, 4, 29, 25);

insert into "Song"
(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
values (23, 'keasby nights', 456, 2007, 4, 29, 25);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreID, ArtistId, AlbumID)
SELECT "trust", 3456, 1986, g.GenreID, al

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
--  Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
--  Here is some more info on joins that might help.
--------------EXAMPLE--------------------------------
-- SELECT column_name(s)
-- FROM table1
-- LEFT JOIN table2 ON table1.column_name = table2.column_name;

-- SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT s.title as "Song", ar.artistName, al.title as "Album"
FROM artist ar
JOIN Album al ON al.Artistid = ar.artistid
LEFT JOIN SONG s ON al.Albumid = s.albumid
WHERE ar.artistname = "Streetlight Manifesto"

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.title,COUNT(songid)
FROM song s
LEFT JOIN Album a ON s.albumid = albumid
GROUP BY s.albumid 
ORDER BY a.title

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT albumlength, title
FROM album
WHERE albumlength = (SELECT MAX(albumlength) FROM album);

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

-- Modify the previous query to also display the title of the album.