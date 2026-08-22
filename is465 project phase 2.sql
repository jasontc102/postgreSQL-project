CREATE TABLE Team (
    team_name VARCHAR(100) PRIMARY KEY,
    factory_location VARCHAR(50),
	constructors_championships INT
);

INSERT INTO Team (team_name, factory_location, constructors_championships) VALUES
('Red Bull Racing', 'Milton Keynes', 6),
('Mercedes', 'Brackley', 8),
('Ferrari', 'Maranello', 16),
('McLaren', 'Woking', 8),
('Alpine', 'Enstone', 0),
('Aston Martin', 'Silverstone', 0),
('AlphaTauri', 'Faenza', 0),
('Williams', 'Grove', 9),
('Haas', 'Kannapolis', 0),
('Sauber', 'Hinwil', 0);

SELECT * FROM Driver;

ALTER TABLE Team
ALTER COLUMN team_name TYPE VARCHAR(100);

CREATE TABLE Driver (
    Driver_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Nationality VARCHAR(50),
    Annual_Salary DECIMAL(10, 2),
    Contract_Expiration_Year INT,
    Championships_Won INT,
    Points_Scored_This_Season INT,
    Podiums INT,
    Pole_Positions INT,
    Team_Name VARCHAR(100) REFERENCES Team(team_name)
);

DROP TABLE Driver;
DROP TABLE TeamPrincipal;
DROP TABLE Engineer;
DROP TABLE Car;
DROP TABLE Championship;
DROP TABLE Owner;
DROP TABLE Season;
DROP TABLE Sponsor;
DROP TABLE Circuit;
DROP TABLE GrandPrix;
DROP TABLE TrackMarshal;
DROP TABLE Spectator;
DROP TABLE PitCrew;


INSERT INTO Driver (Name, DOB, Nationality, Annual_Salary, Contract_Expiration_Year, Championships_Won, Points_Scored_This_Season, Podiums, Pole_Positions, Team_Name) VALUES

('Max Verstappen', '1997-09-30', 'Dutch', 50000000, 2024, 2, 250, 12, 3, 'Red Bull Racing'),
('Sergio Perez', '1990-01-26', 'Mexican', 10000000, 2024, 0, 180, 8, 1, 'Red Bull Racing'),
('Lewis Hamilton', '1985-01-07', 'British', 70000000, 2024, 7, 250, 15, 5, 'Mercedes'),
('George Russell', '1998-02-15', 'British', 12000000, 2024, 0, 220, 10, 3, 'Mercedes'),
('Charles Leclerc', '1997-10-16', 'Monégasque', 12000000, 2024, 0, 210, 9, 4, 'Ferrari'),
('Carlos Sainz', '1994-09-01', 'Spanish', 9000000, 2024, 0, 190, 7, 2, 'Ferrari'),
('Daniel Ricciardo', '1989-07-01', 'Australian', 7000000, 2024, 0, 160, 5, 2, 'McLaren'),
('Esteban Ocon', '1996-09-17', 'French', 5000000, 2024, 0, 130, 3, 0, 'Alpine'),
('Pierre Gasly', '1996-02-23', 'French', 6000000, 2024, 0, 140, 4, 1, 'Alpine'),
('Fernando Alonso', '1981-07-29', 'Spanish', 30000000, 2024, 2, 200, 10, 5, 'Aston Martin'),
('Lance Stroll', '1998-10-29', 'Canadian', 8000000, 2024, 0, 130, 3, 0, 'Aston Martin'),
('Yuki Tsunoda', '2000-05-11', 'Japanese', 5000000, 2024, 0, 100, 1, 0, 'AlphaTauri'),
('Nyck de Vries', '1995-02-06', 'Dutch', 6000000, 2024, 0, 90, 2, 1, 'AlphaTauri'),
('Alex Albon', '1996-03-23', 'Thai', 5000000, 2024, 0, 110, 3, 1, 'Williams'),
('Nicholas Latifi', '1995-06-29', 'Canadian', 4000000, 2024, 0, 80, 1, 0, 'Williams'),
('Mick Schumacher', '1999-03-22', 'German', 3000000, 2024, 0, 70, 0, 0, 'Haas'),
('Kevin Magnussen', '1992-10-05', 'Danish', 6000000, 2024, 0, 100, 2, 1, 'Haas'),
('Valtteri Bottas', '1989-08-28', 'Finnish', 7000000, 2024, 0, 150, 6, 2, 'Sauber'),
('Zhou Guanyu', '1999-05-30', 'Chinese', 4000000, 2024, 0, 120, 4, 0, 'Sauber');



SELECT * FROM Driver;

CREATE TABLE TeamPrincipal (
    TeamPrincipal_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Nationality VARCHAR(50),
    Salary DECIMAL(10, 2),
    Team_Name VARCHAR(100) REFERENCES Team(team_name)
);

INSERT INTO TeamPrincipal (Name, DOB, Nationality, Salary, Team_Name) VALUES
('Christian Horner', '1973-11-16', 'British', 2000000.00, 'Red Bull Racing'),
('Toto Wolff', '1972-01-12', 'Austrian', 8000000.00, 'Mercedes'),
('Mattia Binotto', '1969-11-03', 'Italian', 1500000.00, 'Ferrari'),
('Andreas Seidl', '1976-10-06', 'German', 1200000.00, 'McLaren'),
('Laurent Rossi', '1974-05-23', 'French', 1000000.00, 'Alpine'),
('Otmar Szafnauer', '1964-01-01', 'Romanian', 900000.00, 'Aston Martin'),
('Franz Tost', '1956-11-20', 'Austrian', 800000.00, 'AlphaTauri'),
('Jost Capito', '1958-06-19', 'German', 700000.00, 'Williams'),
('Guenther Steiner', '1965-04-07', 'Italian', 600000.00, 'Haas'),
('Frederic Vasseur', '1968-10-28', 'French', 700000.00, 'Alfa Romeo Racing');

CREATE TABLE Engineer (
    Engineer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Salary DECIMAL(10, 2),
    Job_Title VARCHAR(50),
    Team_Name VARCHAR(100) REFERENCES Team(team_name)
);

CREATE TABLE Car (
    Car_ID SERIAL PRIMARY KEY,
    Model VARCHAR(100),
    Engine_Manufacturer VARCHAR(100),
    Year INT,
    Team_Name VARCHAR(100) REFERENCES Team(team_name)
);

CREATE TABLE Championship (
    Championship_Year INT,
    Driver_Ranking INT,
    Team_Ranking INT,
    Driver_ID INT REFERENCES Driver(Driver_ID),
    Team_Name VARCHAR(100) REFERENCES Team(team_name), 
    PRIMARY KEY (Championship_Year, Driver_ID)
);

CREATE TABLE Owner (
    Owner_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Ownership_Percentage DECIMAL(5, 2), 
    Team_Name VARCHAR(100) REFERENCES Team(team_name)
);

CREATE TABLE Season (
    Season_ID SERIAL PRIMARY KEY,
    Drivers_Champion INT REFERENCES Driver(Driver_ID),  -- Driver_ID for the champion
    Constructors_Champion VARCHAR(100) REFERENCES Team(team_name),  -- Team_Name for the champion
    Start_Date DATE,
    End_Date DATE
);

CREATE TABLE Sponsor (
    Sponsor_ID SERIAL PRIMARY KEY,
    Company VARCHAR(100),
    Contract_Value DECIMAL(15, 2),
    Start_Date DATE,
    End_Date DATE,
    Team_Name VARCHAR(100) REFERENCES Team(team_name) -- Assuming Team table already exists
);

CREATE TABLE Circuit (
    Circuit_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    Capacity INT
);

CREATE TABLE GrandPrix (
    Race_ID SERIAL PRIMARY KEY,
    Date DATE,
    Results TEXT, 
    Attendees INT,
    Circuit_ID INT REFERENCES Circuit(Circuit_ID),
    Season_ID INT REFERENCES Season(Season_ID)
);

CREATE TABLE TrackMarshal (
    Marshal_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Home_Circuit_ID INT REFERENCES Circuit(Circuit_ID)
);

CREATE TABLE Spectator (
    Spectator_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    DOB DATE,
    Ticket_Price DECIMAL(10, 2),
    Ticket_Quantity INT
);

CREATE TABLE PitCrew (
    PitCrew_ID SERIAL PRIMARY KEY,
    PitCrew_Role VARCHAR(50),
    PitCrew_Team VARCHAR(100) REFERENCES Team(team_name) -- Assuming Team table already exists
);

INSERT INTO Engineer (Name, DOB, Salary, Job_Title, Team_Name) VALUES
-- Red Bull Racing
('Adrian Newey', '1985-03-12', 120000.00, 'Chief Engineer', 'Red Bull Racing'),
('Pierre Wache', '1987-12-14', 105000.00, 'Aerodynamics Lead', 'Red Bull Racing'),
('Paul Monaghan', '1990-07-18', 95000.00, 'Performance Engineer', 'Red Bull Racing'),
('Arjun Desai', '1992-11-30', 88000.00, 'Race Engineer', 'Red Bull Racing'),
('Bart Laker', '1997-11-11', 109000.00, 'Powertrain Engineer', 'Red Bull Racing'),

-- Mercedes
('James Allison', '1987-11-11', 109000.00, 'Chief Engineer', 'Mercedes'),
('Lena Schmidt', '1987-05-04', 115000.00, 'Aerodymanics Lead', 'Mercedes'),
('Tom Evans', '1991-08-21', 91000.00, 'Performance Engineer', 'Mercedes'),
('Chen Wei', '1993-01-14', 87000.00, 'Race Engineer', 'Mercedes'),
('Maner Hanz', '1943-01-14', 90000.00, 'Race Engineer', 'Mercedes'),
('Loki Nam', '1963-01-14', 91000.00, 'Race Engineer', 'Mercedes'),
-- Ferrari
('Enrico Gualtieri', '1986-02-25', 118000.00, 'Chief Engineer', 'Ferrari'),
('Loic Serra', '1990-09-12', 92000.00, 'Performance Engineer', 'Ferrari'),
('Luigi Centenari', '1992-12-09', 87000.00, 'Race Engineer', 'Ferrari'),
('Luigi Manzoliz', '1990-12-10', 85000.00, 'Race Engineer', 'Ferrari'),

-- McLaren
('David Clarke', '1988-06-30', 110000.00, 'Chief Engineer', 'McLaren'),
('Priya Nair', '1991-10-15', 89000.00, 'Performance Engineer', 'McLaren'),
('Ravi Patel', '1993-03-28', 86000.00, 'Race Engineer', 'McLaren'),

-- Alpine
('Pierre Dubois', '1989-07-17', 108000.00, 'Chief Engineer', 'Alpine'),
('Samantha Hayes', '1992-04-25', 86000.00, 'Performance Engineer', 'Alpine'),
('Lucas Meier', '1994-09-02', 84000.00, 'Race Engineer', 'Alpine'),

-- Aston Martin
('Nina Braun', '1990-03-05', 88000.00, 'Performance Engineer', 'Aston Martin'),
('Isaac King', '1993-06-23', 85000.00, 'Race Engineer', 'Aston Martin'),

-- AlphaTauri
('Takumi Ito', '1989-01-20', 102000.00, 'Chief Engineer', 'AlphaTauri'),
('Maria Lopez', '1991-11-07', 87000.00, 'Performance Engineer', 'AlphaTauri'),
('Alex Rossi', '1994-08-18', 83000.00, 'Race Engineer', 'AlphaTauri'),

-- Williams
('Emma Thompson', '1986-10-13', 107000.00, 'Chief Engineer', 'Williams'),
('Joshua Brooks', '1990-02-22', 88000.00, 'Performance Engineer', 'Williams'),
('Zara Khan', '1993-12-01', 84000.00, 'Race Engineer', 'Williams'),

-- Haas
('Jack Miller', '1988-05-06', 99000.00, 'Chief Engineer', 'Haas'),
('Anya Petrova', '1991-09-19', 85000.00, 'Performance Engineer', 'Haas'),

-- Sauber
('Freya Nilsson', '1992-01-27', 87000.00, 'Performance Engineer', 'Sauber'),
('Carlos Jimenez', '1994-10-10', 83000.00, 'Race Engineer', 'Sauber');

INSERT INTO Car (Model, Engine_Manufacturer, Year, Team_Name) VALUES
-- Red Bull Racing
('RB20', 'Honda RBPT', 2024, 'Red Bull Racing'),

-- Mercedes
('W15', 'Mercedes', 2024, 'Mercedes'),

-- Ferrari
('SF-24', 'Ferrari', 2024, 'Ferrari'),

-- McLaren
('MCL38', 'Mercedes', 2024, 'McLaren'),

-- Alpine
('A524', 'Renault', 2024, 'Alpine'),

-- Aston Martin
('AMR24', 'Mercedes', 2024, 'Aston Martin'),

-- AlphaTauri
('AT05', 'Honda RBPT', 2024, 'AlphaTauri'),

-- Williams
('FW46', 'Mercedes', 2024, 'Williams'),

-- Haas
('VF-24', 'Ferrari', 2024, 'Haas'),

-- Sauber
('C44', 'Ferrari', 2024, 'Sauber');

INSERT INTO Championship (Championship_Year, Driver_Ranking, Team_Ranking, Driver_ID, Team_Name) VALUES
(2024, 1, 2, 1, 'Red Bull Racing'),
(2024, 2, 1, 2, 'Mercedes'),
(2024, 3, 3, 3, 'Ferrari'),
(2024, 4, 4, 4, 'McLaren'),
(2024, 5, 5, 5, 'Aston Martin'),
(2024, 6, 6, 6, 'Alpine'),
(2024, 7, 7, 7, 'AlphaTauri'),
(2024, 8, 8, 8, 'Williams'),
(2024, 9, 9, 9, 'Haas'),
(2024, 10, 10, 10, 'Sauber'),
(2023, 1, 1, 1, 'Red Bull Racing'),
(2023, 2, 2, 2, 'Mercedes'),
(2023, 3, 3, 3, 'Ferrari'),
(2023, 4, 4, 4, 'McLaren'),
(2023, 5, 5, 5, 'Aston Martin'),
(2023, 6, 6, 6, 'Alpine'),
(2023, 7, 7, 7, 'AlphaTauri'),
(2023, 8, 8, 8, 'Williams'),
(2023, 9, 9, 9, 'Haas'),
(2023, 10, 10, 10, 'Sauber'),
(2022, 1, 1, 1, 'Red Bull Racing'),
(2022, 2, 2, 2, 'Mercedes'),
(2022, 3, 3, 3, 'Ferrari'),
(2022, 4, 4, 4, 'McLaren'),
(2022, 5, 5, 5, 'Aston Martin'),
(2022, 6, 6, 6, 'Alpine'),
(2022, 7, 7, 7, 'AlphaTauri'),
(2022, 8, 8, 8, 'Williams'),
(2022, 9, 9, 9, 'Haas'),
(2022, 10, 10, 10, 'Sauber'),
(2021, 1, 2, 1, 'Red Bull Racing'),
(2021, 2, 1, 2, 'Mercedes'),
(2021, 3, 3, 3, 'Ferrari'),
(2021, 4, 4, 4, 'McLaren'),
(2021, 5, 5, 5, 'Aston Martin'),
(2021, 6, 6, 6, 'Alpine'),
(2021, 7, 7, 7, 'AlphaTauri'),
(2021, 8, 8, 8, 'Williams'),
(2021, 9, 9, 9, 'Haas'),
(2021, 10, 10, 10, 'Sauber'),
(2020, 1, 2, 1, 'Red Bull Racing'),
(2020, 2, 1, 2, 'Mercedes'),
(2020, 3, 3, 3, 'Ferrari'),
(2020, 4, 4, 4, 'McLaren'),
(2020, 5, 5, 5, 'Aston Martin'),
(2020, 6, 6, 6, 'Alpine'),
(2020, 7, 7, 7, 'AlphaTauri'),
(2020, 8, 8, 8, 'Williams'),
(2020, 9, 9, 9, 'Haas'),
(2020, 10, 10, 10, 'Sauber'),
(2019, 1, 2, 1, 'Red Bull Racing'),
(2019, 2, 1, 2, 'Mercedes'),
(2019, 3, 3, 3, 'Ferrari'),
(2019, 4, 4, 4, 'McLaren'),
(2019, 5, 5, 5, 'Aston Martin'),
(2019, 6, 6, 6, 'Alpine'),
(2019, 7, 7, 7, 'AlphaTauri'),
(2019, 8, 8, 8, 'Williams'),
(2019, 9, 9, 9, 'Haas'),
(2019, 10, 10, 10, 'Sauber'),
(2018, 1, 2, 1, 'Red Bull Racing'),
(2018, 2, 1, 2, 'Mercedes'),
(2018, 3, 3, 3, 'Ferrari'),
(2018, 4, 4, 4, 'McLaren'),
(2018, 5, 5, 5, 'Aston Martin'),
(2018, 6, 6, 6, 'Alpine'),
(2018, 7, 7, 7, 'AlphaTauri'),
(2018, 8, 8, 8, 'Williams'),
(2018, 9, 9, 9, 'Haas'),
(2018, 10, 10, 10, 'Sauber'),
(2017, 1, 2, 1, 'Red Bull Racing'),
(2017, 2, 1, 2, 'Mercedes'),
(2017, 3, 3, 3, 'Ferrari'),
(2017, 4, 4, 4, 'McLaren'),
(2017, 5, 5, 5, 'Aston Martin'),
(2017, 6, 6, 6, 'Alpine'),
(2017, 7, 7, 7, 'AlphaTauri'),
(2017, 8, 8, 8, 'Williams'),
(2017, 9, 9, 9, 'Haas'),
(2017, 10, 10, 10, 'Sauber'),
(2016, 1, 1, 1, 'Mercedes'),
(2016, 2, 2, 2, 'Mercedes'),
(2016, 3, 3, 3, 'Ferrari'),
(2016, 4, 4, 4, 'McLaren'),
(2016, 5, 5, 5, 'Aston Martin'),
(2016, 6, 6, 6, 'Alpine'),
(2016, 7, 7, 7, 'AlphaTauri'),
(2016, 8, 8, 8, 'Williams'),
(2016, 9, 9, 9, 'Haas'),
(2016, 10, 10, 10, 'Sauber');


INSERT INTO Owner (Name, Ownership_Percentage, Team_Name) VALUES
('Dietrich Mateschitz', 51, 'Red Bull Racing'),
('Mercedes-Benz Group', 33, 'Mercedes'),
('Exor N.V.', 50, 'Ferrari'),
('McLaren Group', 100, 'McLaren'),
('Renault Group', 100, 'Alpine'),
('Lawrence Stroll', 100, 'Aston Martin'),
('Red Bull GmbH', 100, 'AlphaTauri'),
('Daimler AG', 100, 'Williams'),
('Gene Haas', 100, 'Haas');

INSERT INTO Circuit (Name, Country, City, Capacity) VALUES
('Bahrain International Circuit', 'Bahrain', 'Sakhir', 143810),
('Jeddah Corniche Circuit', 'Saudi Arabia', 'Jeddah', 74592),
('Albert Park Circuit', 'Australia', 'Melbourne', 63278),
('Suzuka International Racing Course', 'Japan', 'Suzuka', 96048),
('Shanghai International Circuit', 'China', 'Shanghai', 92098),
('Miami International Autodrome', 'USA', 'Miami', 82000),
('Imola Circuit', 'Italy', 'Imola', 98000),
('Circuit de Monaco', 'Monaco', 'Monte Carlo', 37000),
('Circuit de Barcelona-Catalunya', 'Spain', 'Barcelona', 140700),
('Circuit Gilles Villeneuve', 'Canada', 'Montreal', 100000),
('Red Bull Ring', 'Austria', 'Spielberg', 105000),
('Silverstone Circuit', 'UK', 'Silverstone', 150000),
('Hungaroring', 'Hungary', 'Budapest', 70000),
('Circuit de Spa-Francorchamps', 'Belgium', 'Stavelot', 70000),
('Zandvoort Circuit', 'Netherlands', 'Zandvoort', 110000),
('Monza Circuit', 'Italy', 'Monza', 118865),
('Marina Bay Street Circuit', 'Singapore', 'Singapore', 86000),
('Losail International Circuit', 'Qatar', 'Al Daayen', 80000),
('Circuit of the Americas', 'USA', 'Austin', 120000),
('Autodromo Hermanos Rodriguez', 'Mexico', 'Mexico City', 110000),
('Interlagos Circuit', 'Brazil', 'São Paulo', 60000),
('Las Vegas Street Circuit', 'USA', 'Las Vegas', 90000),
('Lusail International Circuit', 'Qatar', 'Lusail', 82000),
('Yas Marina Circuit', 'UAE', 'Abu Dhabi', 60000);

INSERT INTO GrandPrix (Date, Results, Attendees, Circuit_ID, Season_ID) VALUES
('2024-03-10', '1. Max Verstappen (Red Bull Racing) | 2. Lewis Hamilton (Mercedes) | 3. Charles Leclerc (Ferrari)', 150000, 1, 2024),
('2024-03-24', '1. Lewis Hamilton (Mercedes) | 2. Max Verstappen (Red Bull Racing) | 3. Lando Norris (McLaren)', 160000, 2, 2024),
('2024-04-07', '1. Charles Leclerc (Ferrari) | 2. Max Verstappen (Red Bull Racing) | 3. George Russell (Mercedes)', 145000, 3, 2024),
('2024-04-21', '1. Sergio Perez (Red Bull Racing) | 2. Carlos Sainz (Ferrari) | 3. Esteban Ocon (Alpine)', 140000, 4, 2024 ),
('2024-05-12', '1. George Russell (Mercedes) | 2. Max Verstappen (Red Bull Racing) | 3. Lando Norris (McLaren)', 155000, 5, 2024),
('2024-06-02', '1. Charles Leclerc (Ferrari) | 2. Max Verstappen (Red Bull Racing) | 3. Valtteri Bottas (Alfa Romeo)', 130000, 6, 2024),
('2024-06-16', '1. Max Verstappen (Red Bull Racing) | 2. Sergio Perez (Red Bull Racing) | 3. Lewis Hamilton (Mercedes)', 160000, 7, 2024),
('2024-06-30', '1. Lando Norris (McLaren) | 2. George Russell (Mercedes) | 3. Carlos Sainz (Ferrari)', 145000, 8, 2024),
('2024-07-14', '1. Max Verstappen (Red Bull Racing) | 2. Lewis Hamilton (Mercedes) | 3. Charles Leclerc (Ferrari)', 150000, 9, 2024),
('2024-07-28', '1. Sergio Perez (Red Bull Racing) | 2. Carlos Sainz (Ferrari) | 3. Lando Norris (McLaren)', 135000, 10, 2024),
('2024-08-25', '1. Max Verstappen (Red Bull Racing) | 2. Lewis Hamilton (Mercedes) | 3. Charles Leclerc (Ferrari)', 160000, 11, 2024),
('2024-09-01', '1. Charles Leclerc (Ferrari) | 2. Max Verstappen (Red Bull Racing) | 3. Esteban Ocon (Alpine)', 145000, 12, 2024),
('2024-09-15', '1. George Russell (Mercedes) | 2. Max Verstappen (Red Bull Racing) | 3. Lando Norris (McLaren)', 150000, 13, 2024),
('2024-09-29', '1. Carlos Sainz (Ferrari) | 2. Max Verstappen (Red Bull Racing) | 3. Sergio Perez (Red Bull Racing)', 135000, 14, 2024),
('2024-10-13', '1. Lando Norris (McLaren) | 2. Max Verstappen (Red Bull Racing) | 3. Lewis Hamilton (Mercedes)', 140000, 15, 2024),
('2024-10-27', '1. Charles Leclerc (Ferrari) | 2. Max Verstappen (Red Bull Racing) | 3. George Russell (Mercedes)', 160000, 16, 2024),
('2024-11-10', '1. Sergio Perez (Red Bull Racing) | 2. Carlos Sainz (Ferrari) | 3. Lando Norris (McLaren)', 155000, 17, 2024),
('2024-11-24', '1. Max Verstappen (Red Bull Racing) | 2. Lewis Hamilton (Mercedes) | 3. Charles Leclerc (Ferrari)', 145000, 18, 2024),
('2024-12-01', '1. Charles Leclerc (Ferrari) | 2. Max Verstappen (Red Bull Racing) | 3. Esteban Ocon (Alpine)', 150000, 19, 2024);

INSERT INTO Season (Season_ID,Drivers_Champion, Constructors_Champion, Start_Date, End_Date) 
VALUES 
(2024, 1, 'Red Bull Racing', '2024-03-01', '2024-12-31');

SELECT * FROM GrandPrix

SELECT T.team_name, COUNT(*) AS Championship_Wins
FROM Team T
JOIN Championship C ON T.team_name = C.Team_Name
WHERE C.Team_Ranking = 1
GROUP BY T.team_name
ORDER BY Championship_Wins DESC
LIMIT 1;

SELECT C.Name AS Circuit_Name, SUM(G.Attendees) AS Total_Attendees
FROM Circuit C
JOIN GrandPrix G ON C.Circuit_ID = G.Circuit_ID
GROUP BY C.Name
ORDER BY Total_Attendees DESC

INSERT INTO Sponsor (Company, Contract_Value, Start_Date, End_Date, Team_Name) 
VALUES
-- Red Bull Racing
('Infiniti', 50.00, '2024-01-01', '2024-12-31', 'Red Bull Racing'),
('TAG Heuer', 40.00, '2024-01-01', '2024-12-31', 'Red Bull Racing'),
('Citibank', 60.00, '2024-01-01', '2024-12-31', 'Red Bull Racing'),
('Mobil 1', 45.00, '2024-01-01', '2024-12-31', 'Red Bull Racing'),
-- Mercedes
('Petronas', 80.00, '2024-01-01', '2024-12-31', 'Mercedes'),
('IWC', 45.00, '2024-01-01', '2024-12-31', 'Mercedes'),
('Tommy Hilfiger', 35.00, '2024-01-01', '2024-12-31', 'Mercedes'),
('Puma', 25.00, '2024-01-01', '2024-12-31', 'Mercedes'),
-- Ferrari
('Shell', 60.00, '2024-01-01', '2024-12-31', 'Ferrari'),
('Pirelli', 50.00, '2024-01-01', '2024-12-31', 'Ferrari'),
('Ray-Ban', 40.00, '2024-01-01', '2024-12-31', 'Ferrari'),
('Maserati', 55.00, '2024-01-01', '2024-12-31', 'Ferrari'),
-- McLaren
('Dell Technologies', 30.00, '2024-01-01', '2024-12-31', 'McLaren'),
('Splunk', 20.00, '2024-01-01', '2024-12-31', 'McLaren'),
('Ubiquiti', 15.00, '2024-01-01', '2024-12-31', 'McLaren'),
('Knauf Insulation', 10.00, '2024-01-01', '2024-12-31', 'McLaren'),
-- Alpine
('BWT', 25.00, '2024-01-01', '2024-12-31', 'Alpine'),
('Givaudan', 15.00, '2024-01-01', '2024-12-31', 'Alpine'),
('Groupe Renault', 50.00, '2024-01-01', '2024-12-31', 'Alpine'),
('Ribery', 30.00, '2024-01-01', '2024-12-31', 'Alpine'),
-- Aston Martin
('Cognizant', 50.00, '2024-01-01', '2024-12-31', 'Aston Martin'),
('Peroni', 30.00, '2024-01-01', '2024-12-31', 'Aston Martin'),
('Aspire', 20.00, '2024-01-01', '2024-12-31', 'Aston Martin'),
('Bamford', 25.00, '2024-01-01', '2024-12-31', 'Aston Martin'),
-- AlphaTauri
('Honda', 40.00, '2024-01-01', '2024-12-31', 'AlphaTauri'),
('CarNext', 15.00, '2024-01-01', '2024-12-31', 'AlphaTauri'),
('Alpine Stars', 10.00, '2024-01-01', '2024-12-31', 'AlphaTauri'),
('Goodyear', 20.00, '2024-01-01', '2024-12-31', 'AlphaTauri'),
-- Williams
('Rokit', 25.00, '2024-01-01', '2024-12-31', 'Williams'),
('Duracell', 20.00, '2024-01-01', '2024-12-31', 'Williams'),
('Porsche', 30.00, '2024-01-01', '2024-12-31', 'Williams'),
('Cognizant', 40.00, '2024-01-01', '2024-12-31', 'Williams'),
-- Haas
('MoneyGram', 30.00, '2024-01-01', '2024-12-31', 'Haas'),
('VF Corporation', 15.00, '2024-01-01', '2024-12-31', 'Haas'),
('Rich Energy', 10.00, '2024-01-01', '2024-12-31', 'Haas'),
('Haas Automation', 20.00, '2024-01-01', '2024-12-31', 'Haas'),
-- Sauber (Alfa Romeo)
('Orlen', 40.00, '2024-01-01', '2024-12-31', 'Sauber'),
('Pirelli', 25.00, '2024-01-01', '2024-12-31', 'Sauber'),
('Alfa Romeo', 35.00, '2024-01-01', '2024-12-31', 'Sauber'),
('Rivian', 50.00, '2024-01-01', '2024-12-31', 'Sauber');

SELECT Team_Name, 
       SUM(Contract_Value) AS Total_Contract_Value
FROM Sponsor
GROUP BY Team_Name
ORDER BY Total_Contract_Value DESC
LIMIT 3;

-- Team with the lowest total engineer salary
(SELECT Team_Name, SUM(Salary) AS Total_Engineer_Salary
 FROM Engineer
 GROUP BY Team_Name
 ORDER BY Total_Engineer_Salary
 LIMIT 1)

UNION ALL

-- Team with the highest total engineer salary
(SELECT Team_Name, SUM(Salary) AS Total_Engineer_Salary
 FROM Engineer
 GROUP BY Team_Name
 ORDER BY Total_Engineer_Salary DESC

SELECT T.Team_Name, 
       (
           SELECT COUNT(*)
           FROM Engineer E
           WHERE E.Team_Name = T.Team_Name
       ) AS Engineer_Count
FROM Team T
ORDER BY Engineer_Count DESC;

SELECT D.Name AS Driver_Name,
       D.DOB,
       DATE_PART('year', AGE(CURRENT_DATE, D.DOB)) AS Age,
       D.Nationality,
       D.Team_Name
FROM Driver D
WHERE D.Driver_ID IN (
    SELECT DISTINCT C.Driver_ID
    FROM Championship C
    WHERE C.Championship_Year = (
        SELECT MAX(Championship_Year)
        FROM Championship
    )
)
ORDER BY Age ASC
LIMIT 1;

SELECT D.Name AS Driver_Name,
       D.DOB,
       DATE_PART('year', AGE(CURRENT_DATE, D.DOB)) AS Age,
       D.Nationality,
       D.Team_Name
FROM Driver D
WHERE D.Driver_ID IN (
    SELECT DISTINCT C.Driver_ID
    FROM Championship C
    WHERE C.Championship_Year = (
        SELECT EXTRACT(YEAR FROM MAX(S.Start_Date))
        FROM Season S
    )
)
ORDER BY Age ASC
LIMIT 1;



SELECT * FROM Championship;
