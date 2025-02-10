CREATE DATABASE EDU;
USE EDU;
CREATE TABLE Event (
    Event_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Event_Name VARCHAR(20) NOT NULL,
    Date DATE NOT NULL,
    Country VARCHAR(56) DEFAULT 'Jordan',
    City VARCHAR(30) DEFAULT 'Amman',
    Street_name VARCHAR(30) NOT NULL,
    Building_Number VARCHAR(10) NOT NULL,
    Number_of_Donations INT NOT NULL,
    Organizer_First_Name VARCHAR(10) NOT NULL,
    Organizer_Last_Name VARCHAR(10) NOT NULL
);
CREATE TABLE Donor (
	Donor_ID   INT NOT NULL PRIMARY KEY,
    First_Name VARCHAR(15) NOT NULL,
    Last_Name VARCHAR(15) NOT NULL,
    Email VARCHAR(250) NOT NULL Unique,
    Country VARCHAR(56) Default 'Jordan',
    City VARCHAR(30) NOT NULL,
    Street_name VARCHAR(30) NOT NULL,
    Building_Number VARCHAR(10) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Occupation TEXT
);
CREATE TABLE Volunteer (
	Volunteer_ID   INT NOT NULL PRIMARY KEY,
    First_Name VARCHAR(15) NOT NULL,
    Last_Name VARCHAR(15) NOT NULL,
    Email VARCHAR(250) NOT NULL Unique,
    Country VARCHAR(56) Default 'Jordan',
    City VARCHAR(30) NOT NULL,
    Street_name VARCHAR(30) NOT NULL,
    Building_Number VARCHAR(10) NOT NULL,
    Date_Of_Birth DATE NOT NULL
);
CREATE TABLE Donation (
	Donation_ID INT NOT NULL PRIMARY KEY,
    Donor_ID INT NOT NULL,
	Event_ID INT NOT NULL,
    Donation_Amount DECIMAL(10,3) NOT NULL CHECK (Donation_Amount > 0),
    Payment_Method VARCHAR(20) NOT NULL,
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);
CREATE TABLE Donor_Phone_Numbers (
    Donor_ID INT NOT NULL,
    Phone_Number VARCHAR(15) NOT NULL,
    PRIMARY KEY (Donor_ID, Phone_Number),
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID)
);
CREATE TABLE Volunteer_Phone_Numbers (
    Volunteer_ID INT NOT NULL,
    Phone_Number VARCHAR(15) NOT NULL,
    PRIMARY KEY (Volunteer_ID, Phone_Number),
    FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID)
);
CREATE TABLE Event_Donor (
    Event_ID INT NOT NULL,
    Donor_ID INT NOT NULL,
    PRIMARY KEY (Event_ID, Donor_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID)
);
CREATE TABLE Event_Volunteer (
    Event_ID INT NOT NULL,
    Volunteer_ID INT NOT NULL,
    Role TEXT NOT NULL,
    PRIMARY KEY (Event_ID, Volunteer_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID)
);

CREATE VIEW Recent_Events AS
SELECT Event.Event_ID, Event.Event_Name, Event.Date FROM Event
ORDER BY Event.Event_ID DESC;

CREATE VIEW Top_Donors AS
SELECT Donor.Donor_ID, CONCAT(Donor.First_Name, " ", Donor.Last_Name) AS Full_Name, 
SUM(Donation.Donation_Amount) AS Total_Amount FROM Donor
JOIN Donation ON Donor.Donor_ID = Donation.Donor_ID
GROUP BY Donor.Donor_ID, Full_Name
ORDER BY Total_Amount DESC;

CREATE VIEW Volunteers_In_Event AS
SELECT Event.Event_ID, Event.Event_Name, CONCAT(Volunteer.First_Name, " ", Volunteer.Last_Name) AS Full_Name,
Volunteer.Volunteer_ID FROM Volunteer
JOIN Event_Volunteer ON Volunteer.Volunteer_ID = Event_Volunteer.Volunteer_ID
JOIN Event ON Event_Volunteer.Event_ID = Event.Event_ID;

CREATE VIEW Average_Donation_Amount_Per_Event AS
SELECT  Event.Event_ID, Event.Event_Name, AVG(Donation.Donation_Amount) AS Average_Donation FROM EVENT
JOIN Donation ON Event.Event_ID = Donation.Event_ID
GROUP BY Event.Event_ID, Event.Event_Name;

DELIMITER //
CREATE PROCEDURE Add_Event (
    IN Event_Name VARCHAR(20),
    IN Date DATE, 
    IN Country VARCHAR(56), 
    IN City VARCHAR(30), 
    IN Street_name VARCHAR(30),
    IN Building_Number VARCHAR(10), 
    IN Number_of_Donations INT, 
    IN Organizer_First_Name VARCHAR(10), 
    IN Organizer_Last_Name VARCHAR(10)
)
BEGIN
    INSERT INTO Event (
        Event_Name, 
        Date, 
        Country, 
        City, 
        Street_name, 
        Building_Number, 
        Number_of_Donations,
        Organizer_First_Name, 
        Organizer_Last_Name
    )
    VALUES (
        Event_Name, 
        Date, 
        Country, 
        City, 
        Street_name, 
        Building_Number, 
        Number_of_Donations, 
        Organizer_First_Name, 
        Organizer_Last_Name
    );
END //
DELIMITER ;

CALL Add_Event('Charity Campaign', '2025-02-15', 'Jordan', 'Amman', 'Queen Rania Street', '12A', '15', 'Osama', 'Hasan');

DELIMITER //
CREATE PROCEDURE Events_By_Donor (
    IN Donor_ID INT
)
BEGIN
    SELECT Event.Event_ID, Event.Event_Name, Donation.Donation_Amount, Donation.Payment_Method
    FROM Event
    JOIN Donation ON Event.Event_ID = Donation.Event_ID WHERE Donation.Donor_ID = Donor_ID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE Remove_Volunteer (
    IN p_Volunteer_ID INT, IN p_Event_ID INT
)
BEGIN
    DELETE FROM Event_Volunteer 
    WHERE Volunteer_ID = p_Volunteer_ID AND Event_ID = p_Event_ID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Donations_By_Donor (
    IN Donor_ID INT
)
BEGIN
    SELECT Event.Event_ID, Event.Event_Name, Donation.Donation_Amount, Donation.Payment_Method
    FROM Event JOIN Donation ON Event.Event_ID = Donation.Event_ID
    WHERE Donation.Donor_ID = Donor_ID;
END //
DELIMITER ;

CREATE USER 'Admin' IDENTIFIED BY '%/999';
CREATE USER 'Events_User' IDENTIFIED BY '&*4532';
CREATE USER 'Donations_User' IDENTIFIED BY '@$2005';
CREATE USER 'Donors_User' IDENTIFIED BY '!#9247';
CREATE USER 'Volunteers_User' IDENTIFIED BY '$%321';

GRANT SELECT, INSERT, UPDATE, DELETE ON EDU.* TO Admin;


GRANT SELECT, INSERT, UPDATE ON Event TO Events_User;
GRANT SELECT, INSERT, UPDATE(Event_ID) ON Event_Donor TO Events_User;
GRANT SELECT, INSERT, UPDATE(Event_ID) ON Event_Volunteer TO Events_User;
GRANT SELECT ON Recent_Events TO Events_User;
GRANT EXECUTE ON PROCEDURE Add_Event TO Events_User;

GRANT SELECT, INSERT, UPDATE ON Donation TO Donations_User;
GRANT SELECT, INSERT, UPDATE(Number_of_Donations) ON Event TO Donations_User;
GRANT SELECT ON Average_Donation_Amount_Per_Event TO Donations_User;
GRANT EXECUTE ON PROCEDURE Donations_By_Donor TO Donations_User;


GRANT SELECT, INSERT, UPDATE ON Donor TO Donors_User;
GRANT SELECT, INSERT, UPDATE ON Donor_Phone_Numbers TO Donors_User;
GRANT SELECT, UPDATE(Donor_ID) ON Event_Donor TO Donors_User;
GRANT SELECT ON Top_Donors TO Donors_User;
GRANT EXECUTE ON PROCEDURE Events_By_Donor TO Donations_User;
GRANT EXECUTE ON PROCEDURE Donations_By_Donor TO Donors_User;


GRANT SELECT, INSERT, UPDATE ON Volunteer TO Volunteers_User;
GRANT SELECT, INSERT, UPDATE ON Volunteer_Phone_Numbers TO Volunteers_User;
GRANT SELECT, UPDATE(Volunteer_ID) ON Event_Volunteer TO Volunteers_User;
GRANT SELECT ON Volunteers_In_Event TO Volunteers_User;
GRANT EXECUTE ON PROCEDURE Remove_Volunteer TO Volunteers_User;
