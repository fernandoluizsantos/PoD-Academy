SELECT 
	e.emp_no,
	e.first_name,
	s.from_date,
	s.to_date,
	s.salary
FROM
	salaries s
INNER JOIN
	employees e 
ON 
	s.emp_no = e.emp_no;


-- subqueries
SELECT 
	sq.Nome,
	sq.`Salário`,
	SUM(sq.`Salário`)
FROM (
	SELECT 
		e.emp_no as 'ID funcionario',
		e.first_name as 'Nome',
		s.from_date as 'Data inicio', 
		s.to_date as 'Data Fim',
		s.salary as 'Salário'
	FROM
		salaries s
	INNER JOIN
		employees e 
	ON 
		s.emp_no = e.emp_no
) AS sq
GROUP BY
	sq.Nome
HAVING
	sq.`Salário` > 70000;



SELECT 
	sq.Nome,
	sq.`Salário`,
	SUM(sq.`Salário`)
FROM (
	SELECT 
		e.emp_no as 'ID funcionario',
		e.first_name as 'Nome',
		s.from_date as 'Data inicio', 
		s.to_date as 'Data Fim',
		s.salary as 'Salário'
	FROM
		salaries s
	INNER JOIN
		employees e 
	ON 
		s.emp_no = e.emp_no
) AS sq
GROUP BY
	sq.Nome
HAVING
	sq.`Salário` > 70000;


------------------- EXERCÍCIOS -------------------

CREATE DATABASE `Chinook`;

-- Chinook.Artist definição

CREATE TABLE `Artist` (
  `ArtistId` int(11) NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ArtistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Genre definição

CREATE TABLE `Genre` (
  `GenreId` int(11) NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`GenreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.MediaType definição

CREATE TABLE `MediaType` (
  `MediaTypeId` int(11) NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MediaTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Playlist definição

CREATE TABLE `Playlist` (
  `PlaylistId` int(11) NOT NULL,
  `Name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`PlaylistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Album definição

CREATE TABLE `Album` (
  `AlbumId` int(11) NOT NULL,
  `Title` varchar(160) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ArtistId` int(11) NOT NULL,
  PRIMARY KEY (`AlbumId`),
  KEY `IFK_AlbumArtistId` (`ArtistId`),
  CONSTRAINT `FK_AlbumArtistId` FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`ArtistId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Employee definição

CREATE TABLE `Employee` (
  `EmployeeId` int(11) NOT NULL,
  `LastName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReportsTo` int(11) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `State` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Country` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fax` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `IFK_EmployeeReportsTo` (`ReportsTo`),
  CONSTRAINT `FK_EmployeeReportsTo` FOREIGN KEY (`ReportsTo`) REFERENCES `Employee` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Track definição

CREATE TABLE `Track` (
  `TrackId` int(11) NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AlbumId` int(11) DEFAULT NULL,
  `MediaTypeId` int(11) NOT NULL,
  `GenreId` int(11) DEFAULT NULL,
  `Composer` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Milliseconds` int(11) NOT NULL,
  `Bytes` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TrackId`),
  KEY `IFK_TrackAlbumId` (`AlbumId`),
  KEY `IFK_TrackGenreId` (`GenreId`),
  KEY `IFK_TrackMediaTypeId` (`MediaTypeId`),
  CONSTRAINT `FK_TrackAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `Album` (`AlbumId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TrackGenreId` FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`GenreId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TrackMediaTypeId` FOREIGN KEY (`MediaTypeId`) REFERENCES `MediaType` (`MediaTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Customer definição

CREATE TABLE `Customer` (
  `CustomerId` int(11) NOT NULL,
  `FirstName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LastName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Company` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `State` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Country` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Fax` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SupportRepId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `IFK_CustomerSupportRepId` (`SupportRepId`),
  CONSTRAINT `FK_CustomerSupportRepId` FOREIGN KEY (`SupportRepId`) REFERENCES `Employee` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.Invoice definição

CREATE TABLE `Invoice` (
  `InvoiceId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `InvoiceDate` datetime NOT NULL,
  `BillingAddress` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingCity` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingState` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingCountry` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `BillingPostalCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `IFK_InvoiceCustomerId` (`CustomerId`),
  CONSTRAINT `FK_InvoiceCustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.InvoiceLine definição

CREATE TABLE `InvoiceLine` (
  `InvoiceLineId` int(11) NOT NULL,
  `InvoiceId` int(11) NOT NULL,
  `TrackId` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceLineId`),
  KEY `IFK_InvoiceLineInvoiceId` (`InvoiceId`),
  KEY `IFK_InvoiceLineTrackId` (`TrackId`),
  CONSTRAINT `FK_InvoiceLineInvoiceId` FOREIGN KEY (`InvoiceId`) REFERENCES `Invoice` (`InvoiceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_InvoiceLineTrackId` FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Chinook.PlaylistTrack definição

CREATE TABLE `PlaylistTrack` (
  `PlaylistId` int(11) NOT NULL,
  `TrackId` int(11) NOT NULL,
  PRIMARY KEY (`PlaylistId`,`TrackId`),
  KEY `IFK_PlaylistTrackTrackId` (`TrackId`),
  CONSTRAINT `FK_PlaylistTrackPlaylistId` FOREIGN KEY (`PlaylistId`) REFERENCES `Playlist` (`PlaylistId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PlaylistTrackTrackId` FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;















-- _______________________

SELECT * FROM Customer c;

UPDATE 
	Customer c
SET 
	c.Company = 'Empresa Ficticia'
WHERE c.Company 
	IS NULL;

SELECT * FROM InvoiceLine il;
SELECT * FROM Track t;

WITH base_musicas AS (
	SELECT
		il.InvoiceId,
		il.UnitPrice as 'Preço Unitário',
		t.Name as 'Nome'
	FROM 
		InvoiceLine il 
	INNER JOIN 
		Track t 
	ON
		il.TrackId  = t.TrackId
)
SELECT
    c.FirstName             AS `Primeiro Nome`,
    i.InvoiceId             AS `Número da NF`,
    bm.`Nome`               AS `Música`,
    bm.`Preço Unitário`     AS `Valor Unitário`,
    i.Total                 AS `Valor Total da NF`
FROM Invoice i
INNER JOIN Customer c      ON i.CustomerId = c.CustomerId
INNER JOIN base_musicas bm ON i.InvoiceId = bm.InvoiceId;

-- ------------------------------------

SELECT 
	c.Email,
	SUM(i.Total)
FROM 
	Invoice i 
INNER JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY
	c.Email
ORDER BY 2 DESC
LIMIT 10;


-- -----

SELECT 
	c.CustomerId,
	c.FirstName
FROM 
	Customer c
ORDER BY c.Country;

-- ----------------

SELECT 
	i.CustomerId as 'ID Cliente',
	DATE_FORMAT(i.InvoiceDate, '%d/%m/%Y') as 'Data da NF',
	i.Total,
	LAG(i.Total) OVER (PARTITION BY i.CustomerId ORDER BY i.InvoiceDate)
FROM 
	Invoice i;


