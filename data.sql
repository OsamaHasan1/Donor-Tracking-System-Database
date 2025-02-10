USE EDU;
INSERT INTO Event 
(Event_Name, Date, Country, City, Street_name, Building_Number, Number_of_Donations, Organizer_First_Name, Organizer_Last_Name)
VALUES 
('Blood Donation Drive', '2025-03-01', 'Jordan', 'Irbid', 'Main Road', '45B', 15, 'Hatem', 'Shwayyat'),
('Food Distribution', '2025-04-10', 'Jordan', 'Zarqa', 'Independence Avenue', '8C', 20, 'Wessam', 'Shatarat'),
('Medical Camp', '2025-05-10', 'Jordan', 'Aqaba', 'Health Street', '24B', 12, 'Mohammed', 'Samour'),
('Clothing Drive', '2025-06-20', 'Jordan', 'Mafraq', 'Al-Salam Street', '19', 8, 'Ahmed', 'Mohammed'),
('Education Fundraiser', '2025-07-15', 'Jordan', 'Amman', 'University Street', '30A', 5, 'Leila', 'Kamal'),
('Orphanage Support', '2025-08-10', 'Jordan', 'Irbid', 'Hope Avenue', '18B', 7, 'Mahmoud', 'Tarek'),
('Disaster Relief', '2025-09-05', 'Jordan', 'Zarqa', 'Rescue Road', '22C', 10, 'Hiba', 'Omar'),
('Sports Charity', '2025-10-12', 'Jordan', 'Aqaba', 'Olympic Street', '45D', 3, 'Sami', 'Nour'),
('Animal Welfare Drive', '2025-11-20', 'Jordan', 'Mafraq', 'Nature Park Road', '50E', 4, 'Nada', 'Fouad');


INSERT INTO Donor (Donor_ID, First_Name, Last_Name, Email, Country, City, Street_name, Building_Number, Date_Of_Birth, Occupation)
VALUES 
(1, 'Ahmed', 'Hasan', 'ahmed.hasan@gmail.com', 'Jordan', 'Amman', 'Main Street', '10', '1985-03-15', 'Engineer'),
(2, 'Sara', 'Ali', 'sara.ali@gmail.com', 'Jordan', 'Irbid', 'Second Street', '22', '1990-07-25', 'Doctor'),
(3, 'Omar', 'Kamal', 'omar.kamal@gmail.com', 'Jordan', 'Zarqa', 'Third Street', '33', '1980-01-10', 'Teacher'),
(4, 'Layla', 'Nasser', 'layla.nasser@gmail.com', 'Jordan', 'Aqaba', 'Fourth Street', '44', '1995-05-05', 'Designer'),
(5, 'Hussein', 'Fares', 'hussein.fares@gmail.com', 'Jordan', 'Mafraq', 'Fifth Street', '55', '1975-12-30', 'Businessman');
INSERT INTO Volunteer (Volunteer_ID, First_Name, Last_Name, Email, Country, City, Street_name, Building_Number, Date_Of_Birth)
VALUES 
(1, 'Yasmin', 'Salem', 'yasmin.salem@gmail.com', 'Jordan', 'Amman', 'Main Street', '11', '1998-02-20'),
(2, 'Khaled', 'Tariq', 'khaled.tariq@gmail.com', 'Jordan', 'Irbid', 'Second Street', '21', '1992-03-14'),
(3, 'Rana', 'Othman', 'rana.othman@gmail.com', 'Jordan', 'Zarqa', 'Third Street', '31', '1990-09-12'),
(4, 'Salim', 'Amin', 'salim.amin@gmail.com', 'Jordan', 'Aqaba', 'Fourth Street', '41', '1988-06-08'),
(5, 'Hanan', 'Fouad', 'hanan.fouad@gmail.com', 'Jordan', 'Mafraq', 'Fifth Street', '51', '2000-01-22');
INSERT INTO Donation (Donation_ID, Donor_ID, Event_ID, Donation_Amount, Payment_Method)
VALUES 
(1, 1, 1, 100.000, 'Credit Card'),
(2, 2, 1, 200.000, 'Cash'),
(3, 3, 2, 150.000, 'PayPal'),
(4, 4, 2, 300.000, 'Bank Transfer'),
(5, 5, 3, 250.000, 'Credit Card'),
(6, 1, 3, 400.000, 'Cash'),
(7, 2, 4, 350.000, 'PayPal'),
(8, 3, 4, 500.000, 'Bank Transfer'),
(9, 4, 5, 450.000, 'Credit Card'),
(10, 5, 5, 600.000, 'Cash');
INSERT INTO Volunteer_Phone_Numbers (Volunteer_ID, Phone_Number)
VALUES 
(1, '0771234567'),
(2, '0772345678'),
(3, '0773456789'),
(4, '0774567890'),
(5, '0775678901');
INSERT INTO Donor_Phone_Numbers (Donor_ID, Phone_Number)
VALUES 
(1, '0791234567'),
(2, '0792345678'),
(3, '0793456789'),
(4, '0794567890'),
(5, '0795678901');
INSERT INTO Event_Donor (Event_ID, Donor_ID)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 1),
(4, 3),
(5, 4),
(5, 5);
INSERT INTO Event_Volunteer (Event_ID, Volunteer_ID, Role)
VALUES 
(1, 1, 'Coordinator'),
(1, 2, 'Assistant'),
(2, 3, 'Organizer'),
(2, 4, 'Helper'),
(3, 5, 'Support Staff'),
(4, 1, 'Manager'),
(4, 3, 'Supervisor'),
(5, 4, 'Coordinator'),
(5, 5, 'Assistant');
INSERT INTO Event (Event_ID, Event_Name, Date, Country, City, Street_name, Building_Number, Number_of_Donations)
VALUES 
(6, 'Education Fundraiser', '2025-07-15', 'Jordan', 'Amman', 'University Street', '30A', 5),
(7, 'Orphanage Support', '2025-08-10', 'Jordan', 'Irbid', 'Hope Avenue', '18B', 7),
(8, 'Disaster Relief', '2025-09-05', 'Jordan', 'Zarqa', 'Rescue Road', '22C', 10),
(9, 'Sports Charity', '2025-10-12', 'Jordan', 'Aqaba', 'Olympic Street', '45D', 3),
(10, 'Animal Welfare Drive', '2025-11-20', 'Jordan', 'Mafraq', 'Nature Park Road', '50E', 4);
INSERT INTO Donor (Donor_ID, First_Name, Last_Name, Email, Country, City, Street_name, Building_Number, Date_Of_Birth, Occupation)
VALUES 
(6, 'Fadi', 'Saad', 'fadi.saad@gmail.com', 'Jordan', 'Amman', 'Green Street', '11', '1987-04-14', 'Entrepreneur'),
(7, 'Nour', 'Hussein', 'nour.hussein@gmail.com', 'Jordan', 'Irbid', 'Blue Street', '12', '1993-08-29', 'Journalist'),
(8, 'Karim', 'Yassin', 'karim.yassin@gmail.com', 'Jordan', 'Zarqa', 'Red Street', '13', '1982-06-05', 'Architect'),
(9, 'Salwa', 'Fadel', 'salwa.fadel@gmail.com', 'Jordan', 'Aqaba', 'Yellow Street', '14', '1995-01-17', 'Social Worker'),
(10, 'Tariq', 'Mansour', 'tariq.mansour@gmail.com', 'Jordan', 'Mafraq', 'White Street', '15', '1979-12-09', 'Pilot');
INSERT INTO Volunteer (Volunteer_ID, First_Name, Last_Name, Email, Country, City, Street_name, Building_Number, Date_Of_Birth)
VALUES 
(6, 'Leila', 'Kamal', 'leila.kamal@gmail.com', 'Jordan', 'Amman', 'Green Street', '11', '1996-02-14'),
(7, 'Mahmoud', 'Tarek', 'mahmoud.tarek@gmail.com', 'Jordan', 'Irbid', 'Blue Street', '12', '1994-07-29'),
(8, 'Hiba', 'Omar', 'hiba.omar@gmail.com', 'Jordan', 'Zarqa', 'Red Street', '13', '1983-09-25'),
(9, 'Sami', 'Nour', 'sami.nour@gmail.com', 'Jordan', 'Aqaba', 'Yellow Street', '14', '1989-11-07'),
(10, 'Nada', 'Fouad', 'nada.fouad@gmail.com', 'Jordan', 'Mafraq', 'White Street', '15', '2001-03-15');
INSERT INTO Donation (Donation_ID, Donor_ID, Event_ID, Donation_Amount, Payment_Method)
VALUES 
(11, 6, 6, 120.000, 'Credit Card'),
(12, 7, 6, 250.000, 'Cash'),
(13, 8, 7, 180.000, 'PayPal'),
(14, 9, 7, 310.000, 'Bank Transfer'),
(15, 10, 8, 290.000, 'Credit Card'),
(16, 6, 9, 150.000, 'Cash'),
(17, 7, 9, 400.000, 'PayPal'),
(18, 8, 10, 350.000, 'Bank Transfer'),
(19, 9, 10, 500.000, 'Credit Card'),
(20, 10, 6, 600.000, 'Cash');
INSERT INTO Event_Donor (Event_ID, Donor_ID)
VALUES 
(6, 6), (6, 7),
(7, 8), (7, 9),
(8, 10), (8, 6),
(9, 7), (9, 8),
(10, 9), (10, 10);
INSERT INTO Event_Volunteer (Event_ID, Volunteer_ID, Role)
VALUES 
(6, 6, 'Coordinator'),
(6, 7, 'Assistant'),
(7, 8, 'Organizer'),
(7, 9, 'Helper'),
(8, 10, 'Support Staff'),
(9, 6, 'Manager'),
(9, 8, 'Supervisor'),
(10, 9, 'Coordinator'),
(10, 10, 'Assistant');
INSERT INTO Volunteer_Phone_Numbers (Volunteer_ID, Phone_Number)
VALUES 
(1, '0776789102'),
(2, '0777890113'),
(3, '0778901224'),
(4, '0779012335'),
(5, '0770123446');

