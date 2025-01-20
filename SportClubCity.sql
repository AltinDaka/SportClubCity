/* Krijimi i database */
CREATE DATABASE SportClubCity;

USE SportClubCity;

/* Krijimi i tabelave */
CREATE TABLE Councils (
	CouncilID INT PRIMARY KEY,
	Chairman VARCHAR(255),
	Secretary VARCHAR(255),
	Treasurer VARCHAR(255)
);

CREATE TABLE Departaments (
	DepartamentID INT PRIMARY KEY,
	Budget DECIMAL(10,2),
	Schedule DATE, 
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE Managers (
	ManagerID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	Salary DECIMAL(10,2),
	Departament INT,
	FOREIGN KEY (Departament) REFERENCES Departaments(DepartamentID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE Sponsors (
	SponsorID INT PRIMARY KEY,
	Name VARCHAR(255),
	Budget DECIMAL(10,2),
	Manager INT,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE FootballTeams (
	FootballID INT PRIMARY KEY,
	Name VARCHAR(225),
	Founded DATE,
	JuniorTeam VARCHAR(225),
	Departament INT,
	FOREIGN KEY (Departament) REFERENCES Departaments(DepartamentID),
	Sponsor INT,
	FOREIGN KEY (Sponsor) REFERENCES Sponsors(SponsorID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE BasketballTeams (
	BasketballID INT PRIMARY KEY,
	Name VARCHAR(225),
	Founded DATE,
	JuniorTeam VARCHAR(225),
	Departament INT,
	FOREIGN KEY (Departament) REFERENCES Departaments(DepartamentID),
	Sponsor INT,
	FOREIGN KEY (Sponsor) REFERENCES Sponsors(SponsorID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE VolleyballTeams (
	VolleyballID INT PRIMARY KEY,
	Name VARCHAR(225),
	Founded DATE,
	JuniorTeam VARCHAR(225),
	Departament INT,
	FOREIGN KEY (Departament) REFERENCES Departaments(DepartamentID),
	Sponsor INT,
	FOREIGN KEY (Sponsor) REFERENCES Sponsors(SponsorID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE CoachesFootball (
	FBCoachID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	Experience INT,
	Salary DECIMAL(10,2),
	FBTeam INT,
	FOREIGN KEY (FBTeam) REFERENCES FootballTeams(FootballID),
	Manager INT,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE CoachesBasketball (
	BBCoachID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	Experience INT,
	Salary DECIMAL(10,2),
	BBTeam INT,
	FOREIGN KEY (BBTeam) REFERENCES BasketballTeams(BasketballID),
	Manager INT,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE CoachesVolleyball (
	VBCoachID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	Experience INT,
	Salary DECIMAL(10,2),
	VBTeam INT,
	FOREIGN KEY (VBTeam) REFERENCES VolleyballTeams(VolleyballID),
	Manager INT,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE PlayersFootball (
	FBPlayerID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	JerseyNumber INT,
	Position VARCHAR(255),
	Salary DECIMAL(10,2),
	FBTeam INT,
	FOREIGN KEY (FBTeam) REFERENCES FootballTeams(FootballID),
	Coach INT,
	FOREIGN KEY (Coach) REFERENCES CoachesFootball(FBCoachID),
	Manager INT UNIQUE,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Sponsor INT,
	FOREIGN KEY (Sponsor) REFERENCES Sponsors(SponsorID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE PlayersBasketball (
	BBPlayerID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	JerseyNumber INT,
	Position VARCHAR(255),
	Salary DECIMAL(10,2),
	BBTeam INT,
	FOREIGN KEY (BBTeam) REFERENCES BasketballTeams(BasketballID),
	Coach INT,
	FOREIGN KEY (Coach) REFERENCES CoachesBasketball(BBCoachID),
	Manager INT UNIQUE,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Sponsor INT,
	FOREIGN KEY (Sponsor) REFERENCES Sponsors(SponsorID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE PlayersVolleyball (
	VBPlayerID INT PRIMARY KEY,
	Name VARCHAR(255),
	Age INT,
	JerseyNumber INT,
	Position VARCHAR(255),
	Salary DECIMAL(10,2),
	VBTeam INT,
	FOREIGN KEY (VBTeam) REFERENCES VolleyballTeams(VolleyballID),
	Coach INT,
	FOREIGN KEY (Coach) REFERENCES CoachesVolleyball(VBCoachID),
	Manager INT UNIQUE,
	FOREIGN KEY (Manager) REFERENCES Managers(ManagerID),
	Sponsor INT,
	FOREIGN KEY (Sponsor) REFERENCES Sponsors(SponsorID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID),
);

CREATE TABLE ClubSports (
	ClubSportID INT PRIMARY KEY,
	Name VARCHAR(225),
	Budget DECIMAL(10,2),
	Footboll INT,
	FOREIGN KEY (Footboll) REFERENCES FootballTeams(FootballID),
	Basketball INT,
	FOREIGN KEY (Basketball) REFERENCES BasketballTeams(BasketballID),
	Volleyball INT,
	FOREIGN KEY (Volleyball) REFERENCES VolleyballTeams(VolleyballID),
	Departament INT,
	FOREIGN KEY (Departament) REFERENCES Departaments(DepartamentID),
	Council INT,
	FOREIGN KEY (Council) REFERENCES Councils(CouncilID)
);

/* Insertimi i te dhenave ne tabela */
INSERT INTO Councils (CouncilID, Chairman, Secretary, Treasurer)
VALUES (1, 'Leuard Gashi', 'Florent Haxhaj', 'Altin Daka');


INSERT INTO Departaments (DepartamentID, Budget, Schedule, Council)
VALUES (1, 5000.00, '2022-01-01', 1);

/*Shtimi i kolones Name ne Departaments*/
ALTER TABLE Departaments
ADD Name VARCHAR(255);

/*Shtimi i te dhenes ne Name te Departaments*/
UPDATE Departaments
SET Name = 'Marketing'
WHERE DepartamentID = 1;

/*Insertimi i te dhenave*/
INSERT INTO Managers (ManagerID, Name, Age, Salary, Departament, Council)
VALUES 
(1, 'John Smith', 35, 50000.00, 1, 1),
(2, 'Jane Smith', 32, 40000.00, 1, 1),
(3, 'Mike Johnson', 40, 60000.00, 1, 1),
(4, 'Emily Williams', 38, 55000.00, 1, 1),
(5, 'James Brown', 45, 65000.00, 1, 1),
(6, 'Sara Davis', 30, 45000.00, 1, 1),
(7, 'Edward Taylor', 42, 58000.00, 1, 1),
(8, 'Megan Anderson', 37, 52000.00, 1, 1),
(9, 'William Thompson', 50, 70000.00, 1, 1),
(10, 'Ashley Johnson', 39, 57000.00, 1, 1);

INSERT INTO Managers (ManagerID, Name, Age, Salary, Departament, Council)
VALUES (11, 'Gregg Popovich', 73, 1000000, 1, 1);


INSERT INTO Sponsors (SponsorID, Name, Budget, Manager, Council)
VALUES	(1, 'Red Bull', 100000.00, 1, 1),
		(2, 'Coca Cola', 200000.00, 2, 1),
		(3, 'Pepsi', 300000.00, 3, 1),
		(4, 'Nike', 400000.00, 4, 1),
		(5, 'Adidas', 500000.00, 5, 1),
		(6, 'Under Armour', 600000.00, 6, 1),
		(7, 'Gatorade', 700000.00, 7, 1),
		(8, 'BMW', 800000.00, 8, 1),
		(9, 'Mercedes', 900000.00, 9, 1),
		(10, 'Audi', 1000000.00, 10, 1);

INSERT INTO FootballTeams (FootballID, Name, Founded, JuniorTeam, Departament, Sponsor, Council)
VALUES (1, 'Real Madrid CF', '1902-03-06', 'Real Madrid Castilla', 1, 1, 1);

INSERT INTO BasketballTeams (BasketballID, Name, Founded, JuniorTeam, Departament, Sponsor, Council)
VALUES (1, 'FC Barcelona', '1926-10-22', 'FC Barcelona B', 1, 2, 1);

INSERT INTO VolleyballTeams (VolleyballID, Name, Founded, JuniorTeam, Departament, Sponsor, Council)
VALUES (1, 'Sevilla FC', '1905-01-25', 'Sevilla Atl�tico', 1, 3, 1);


INSERT INTO CoachesFootball (FBCoachID, Name, Age, Experience, Salary, FBTeam, Manager, Council)
VALUES	(1, 'J�rgen Klopp', 53, 20, 250000, 1, 1, 1),
		(2, 'Pep Guardiola', 50, 20, 300000, 1, 2, 1),
		(3, 'Diego Simeone', 50, 15, 200000, 1, 3, 1),
		(4, 'Ole Gunnar Solskjaer', 47, 5, 150000, 1, 4, 1),
		(5, 'Antonio Conte', 53, 15, 250000, 1, 5, 1);

INSERT INTO CoachesBasketball (BBCoachID, Name, Age, Experience, Salary, BBTeam, Manager, Council)
VALUES	(1, 'J�rgen Klopp', 53, 20, 250000, 1, 6, 1),
		(2, 'Pep Guardiola', 50, 20, 300000, 1, 7, 1),
		(3, 'Diego Simeone', 50, 15, 200000, 1, 8, 1),
		(4, 'Ole Gunnar Solskjaer', 47, 5, 150000, 1, 9, 1),
		(5, 'Antonio Conte', 53, 15, 250000, 1, 5, 1);


INSERT INTO CoachesVolleyball (VBCoachID, Name, Age, Experience, Salary, VBTeam, Manager, Council)
VALUES	(1, 'Karch Kiraly', 58, 35, 50000, 1, 1, 1),
		(2, 'Shannon Winters', 49, 25, 60000, 1, 2, 1),
		(3, 'Jenny Lang Ping', 61, 40, 70000, 1, 3, 1),
		(4, 'Masayoshi Manabe', 67, 45, 80000, 1, 4, 1),
		(5, 'Jose Roberto Guimaraes', 71, 50, 90000, 1, 5, 1);


INSERT INTO PlayersFootball (FBPlayerID, Name, Age, JerseyNumber, Position, Salary, FBTeam, Coach, Manager, Sponsor, Council)
VALUES (1, 'Lionel Messi', 33, 10, 'Forward', 1000000, 1, 1, 1, 1, 1),
       (2, 'Cristiano Ronaldo', 36, 7, 'Forward', 2000000, 1, 2, 2, 2, 1),
       (3, 'Neymar Jr', 29, 10, 'Forward', 3000000, 1, 3, 3, 3, 1),
       (4, 'Robert Lewandowski', 32, 9, 'Forward', 4000000, 1, 4, 4, 4, 1),
       (5, 'Kylian Mbappe', 22, 7, 'Forward', 5000000, 1, 5, 5, 5, 1),
       (6, 'Kevin De Bruyne', 29, 8, 'Midfielder', 6000000, 1, 1, 6, 6, 1),
       (7, 'Sadio Mane', 28, 10, 'Midfielder', 7000000, 1, 2, 7, 7, 1),
       (8, 'Raheem Sterling', 26, 7, 'Midfielder', 8000000, 1, 3, 8, 8, 1),
       (9, 'Paul Pogba', 27, 8, 'Midfielder', 9000000, 1, 4, 9, 9, 1),
       (10, 'Luka Modric', 35, 10, 'Midfielder', 10000000, 1, 5, 10, 10, 1),
       (11, 'Jan Oblak', 28, 1, 'Goalkeeper', 11000000, 1, 3, 11, 7, 1);

INSERT INTO PlayersBasketball (BBPlayerID, Name, Age, JerseyNumber, Position, Salary, BBTeam, Coach, Manager, Sponsor, Council)
VALUES	(1, 'LeBron James', 36, 6, 'Small Forward', 37000000, 1, 1, 1, 1, 1),
		(2, 'Stephen Curry', 33, 30, 'Point Guard', 43000000, 1, 2, 2, 2, 1),
		(3, 'James Harden', 31, 13, 'Shooting Guard', 47000000, 1, 3, 3, 3, 1),
		(4, 'Kevin Durant', 32, 7, 'Small Forward', 39000000, 1, 4, 4, 4, 1),
		(5, 'Giannis Antetokounmpo', 25, 34, 'Power Forward', 34000000, 1, 5, 5, 5, 1);


INSERT INTO PlayersVolleyball (VBPlayerID, Name, Age, JerseyNumber, Position, Salary, VBTeam, Coach, Manager, Sponsor, Council)
VALUES	(1, 'Jin-Sung Kang', 26, 8, 'Outside Hitter', 100000, 1, 1, 6, 6, 1),
		(2, 'Roberto Santoro', 28, 1, 'Setter', 125000, 1, 2, 7, 7, 1),
		(3, 'Thomas Edgar', 30, 2, 'Libero', 115000, 1, 3, 8, 8, 1),
		(4, 'Tatyana Kosheleva', 31, 11, 'Opposite', 110000, 1, 4, 9, 9, 1),
		(5, 'Kim Yeon-Koung', 30, 14, 'Outside Hitter', 135000, 1, 5, 10, 10, 1);

INSERT INTO ClubSports (ClubSportID, Name, Budget, Footboll, Basketball, Volleyball, Departament, Council)
VALUES (1, 'ClubSport 1', 100000.00, 1, 1, 1, 1, 1);



/* Krijimi i indeksve */

CREATE INDEX councilIndex
ON Councils (Chairman);

CREATE INDEX departamentIndex 
ON Departaments (Schedule);

CREATE INDEX managerIndex 
ON Managers (ManagerID);

CREATE INDEX sponsorIndex
ON Sponsors (SponsorID);

CREATE INDEX footballIndex 
ON FootballTeams (Name);

CREATE INDEX basketballIndex 
ON BasketballTeams (Name);

CREATE INDEX volleyballIndex 
ON VolleyballTeams (Name);

CREATE INDEX coachFootballIndex 
ON CoachesFootball (Name);

CREATE INDEX coachBasketballIndex 
ON CoachesBasketball (Name);

CREATE INDEX playerFootballIndex
ON PlayersFootball (JerseyNumber);

CREATE INDEX playerBasketballIndex
ON PlayersBasketball (JerseyNumber);

CREATE INDEX playerVolleyballIndex
ON PlayersVolleyball (JerseyNumber);

/*Fshrija e nje te dhene ne tabele*/
DELETE FROM PlayersFootball
WHERE FBPlayerID = 11;


/*Te dhenat e menagjerve te trajerve te futbollit*/
SELECT Managers.Name, Managers.Age, Managers.Salary
FROM Managers
JOIN CoachesFootball ON Managers.ManagerID = CoachesFootball.Manager;

/*Te dhenat e lojtarve te futbollit dhe basketbollit me rroge me te vogel se 40milion*/
SELECT DISTINCT PlayersBasketball.Name, PlayersBasketball.Salary, PlayersFootball.Name, PlayersFootball.Salary
FROM PlayersBasketball, PlayersFootball
WHERE PlayersBasketball.Salary < 40000000 AND PlayersFootball.Salary < 4000000;


/*Te dhenat e te gjithe lojtarve qe kane sponsor nike*/
SELECT DISTINCT Name FROM (
    SELECT PlayersFootball.Name as Name
    FROM PlayersFootball
    JOIN Sponsors ON PlayersFootball.Sponsor = Sponsors.SponsorID
    WHERE Sponsors.Name = 'Nike'
    UNION
    SELECT PlayersBasketball.Name as Name
    FROM PlayersBasketball
    JOIN Sponsors ON PlayersBasketball.Sponsor = Sponsors.SponsorID
    WHERE Sponsors.Name = 'Nike'
    UNION
    SELECT PlayersVolleyball.Name as Name
    FROM PlayersVolleyball
    JOIN Sponsors ON PlayersVolleyball.Sponsor = Sponsors.SponsorID
    WHERE Sponsors.Name = 'Nike'
) as players;

/*Te dhenat e numrit te fanelles tek lojtaret*/
SELECT Name, JerseyNumber
FROM PlayersFootball
UNION
SELECT Name, JerseyNumber
FROM PlayersBasketball
UNION
SELECT Name, JerseyNumber
FROM PlayersVolleyball;


/*Te dhenat e te menagjerve, lojtareve dhe trajnereve qe ju fillon emri me 'J'*/
SELECT Name FROM Managers
WHERE Name LIKE 'J%'
UNION
SELECT Name FROM PlayersFootball
WHERE Name LIKE 'J%'
UNION
SELECT Name FROM CoachesFootball
WHERE Name LIKE 'J%'
UNION
SELECT Name FROM PlayersBasketball
WHERE Name LIKE 'J%'
UNION
SELECT Name FROM CoachesBasketball
WHERE Name LIKE 'J%'
UNION
SELECT Name FROM PlayersVolleyball
WHERE Name LIKE 'J%'
UNION
SELECT Name FROM CoachesVolleyball
WHERE Name LIKE 'J%';


/*Te dhenat e menagjerve, lojtareve dhe trajnerve qe kane moshen 30vjeqe*/
SELECT Name FROM Managers
WHERE Age = 30
UNION
SELECT Name FROM PlayersFootball
WHERE Age = 30
UNION
SELECT Name FROM CoachesFootball
WHERE Age = 30
UNION
SELECT Name FROM PlayersBasketball
WHERE Age = 30
UNION
SELECT Name FROM CoachesBasketball
WHERE Age = 30
UNION
SELECT Name FROM PlayersVolleyball
WHERE Age = 30
UNION
SELECT Name FROM CoachesVolleyball
WHERE Age = 30;

/*Numrimi i te dhenave ne pozicionet e volejbollit qe luhen*/
SELECT Position, COUNT(*) as Count
FROM PlayersVolleyball
GROUP BY Position
ORDER BY Count DESC;