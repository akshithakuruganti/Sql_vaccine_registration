CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Gender VARCHAR(10),
    RegisteredAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
   
INSERT INTO Users (UserID, First_Name, Last_Name, DOB, Email, Phone, Address, Gender)
VALUES 
(1, 'Amit', 'Sharma', '1990-05-14', 'amit.sharma@example.com', '9876543210', '123 MG Road, Delhi', 'Male'),
(2, 'Priya', 'Kumar', '1992-07-23', 'priya.kumar@example.com', '8765432109', '456 Brigade Road, Bangalore', 'Female'),
(3, 'Rajesh', 'Verma', '1988-03-19', 'rajesh.verma@example.com', '7654321098', '789 Link Road, Mumbai', 'Male'),
(4, 'Sneha', 'Patil', '1994-11-12', 'sneha.patil@example.com', '6543210987', '101 Park Street, Kolkata', 'Female'),
(5, 'Vikas', 'Reddy', '1985-01-25', 'vikas.reddy@example.com', '5432109876', '202 Marina Drive, Hyderabad', 'Male'),
(6, 'Anjali', 'Nair', '1991-06-18', 'anjali.nair@example.com', '4321098765', '303 Hill View, Pune', 'Female'),
(7, 'Suresh', 'Iyer', '1987-09-05', 'suresh.iyer@example.com', '3210987654', '404 Coastal Road, Chennai', 'Male'),
(8, 'Neha', 'Singh', '1995-02-10', 'neha.singh@example.com', '2109876543', '505 Gariahat Road, Kolkata', 'Female'),
(9, 'Arjun', 'Chauhan', '1993-04-08', 'arjun.chauhan@example.com', '1098765432', '606 Lal Bagh, Lucknow', 'Male'),
(10, 'Meera', 'Das', '1989-12-30', 'meera.das@example.com', '9988776655', '707 VIP Road, Bhubaneswar', 'Female');

CREATE TABLE Vaccines (
    VaccineID INT PRIMARY KEY,
    VaccineName VARCHAR(100),
    Manufacturer VARCHAR(100),
    DosesRequired INT,
    Description TEXT
);

INSERT INTO Vaccines (VaccineID, VaccineName, Manufacturer, DosesRequired, Description)
VALUES 
(1, 'Covaxin', 'Bharat Biotech', 2, 'An inactivated virus-based COVID-19 vaccine.'),
(2, 'Covishield', 'Serum Institute of India', 2, 'A viral vector vaccine for COVID-19.'),
(3, 'Sputnik V', 'Gamaleya Research Institute', 2, 'A viral vector vaccine for COVID-19.'),
(4, 'Moderna', 'Moderna, Inc.', 2, 'An mRNA-based COVID-19 vaccine.'),
(5, 'Pfizer', 'Pfizer Inc.', 2, 'An mRNA-based COVID-19 vaccine.'),
(6, 'Johnson & Johnson', 'Johnson & Johnson', 1, 'A viral vector vaccine for COVID-19.'),
(7, 'FluShield', 'Serum Institute of India', 1, 'A flu vaccine.'),
(8, 'BCG', 'Statens Serum Institut', 1, 'A vaccine for tuberculosis.'),
(9, 'Polio Vaccine', 'Sanofi', 1, 'A vaccine for polio.'),
(10, 'Hepatitis B', 'GlaxoSmithKline', 3, 'A vaccine for Hepatitis B.');

CREATE TABLE Centers (
    CenterID INT PRIMARY KEY,
    CenterName VARCHAR(100),
    Address VARCHAR(255),
    ContactNumber VARCHAR(15)
);

INSERT INTO Centers (CenterID, CenterName, Address, ContactNumber)
VALUES 
(1, 'Apollo Hospital', 'Secunderabad, Hyderabad', '0401234567'),
(2, 'AIIMS Delhi', 'Ansari Nagar, New Delhi', '0112345678'),
(3, 'Fortis Hospital', 'Bannerghatta Road, Bangalore', '0803456789'),
(4, 'Manipal Hospital', 'Old Airport Road, Bangalore', '0804567890'),
(5, 'Medanta', 'Sector 38, Gurgaon', '0124123456'),
(6, 'Narayana Health', 'Howrah, Kolkata', '0331234567'),
(7, 'KEM Hospital', 'Parel, Mumbai', '0222345678'),
(8, 'Jaslok Hospital', 'Pedder Road, Mumbai', '0223456789'),
(9, 'Max Hospital', 'Saket, New Delhi', '0114567890'),
(10, 'Care Hospital', 'Banjara Hills, Hyderabad', '0402345678');

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    UserID INT,
    VaccineID INT,
    CenterID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (VaccineID) REFERENCES Vaccines(VaccineID),
    FOREIGN KEY (CenterID) REFERENCES Centers(CenterID)
);
INSERT INTO Appointments (AppointmentID, UserID, VaccineID, CenterID, AppointmentDate, AppointmentTime, Status)
VALUES 
(1, 1, 1, 1, '2024-09-15', '09:00:00', 'Pending'),
(2, 2, 2, 2, '2024-09-16', '10:30:00', 'Pending'),
(3, 3, 3, 3, '2024-09-17', '11:00:00', 'Pending'),
(4, 4, 4, 4, '2024-09-18', '12:00:00', 'Pending'),
(5, 5, 5, 5, '2024-09-19', '13:00:00', 'Pending'),
(6, 6, 6, 6, '2024-09-20', '14:00:00', 'Pending'),
(7, 7, 7, 7, '2024-09-21', '15:00:00', 'Pending'),
(8, 8, 8, 8, '2024-09-22', '16:00:00', 'Pending'),
(9, 9, 9, 9, '2024-09-23', '17:00:00', 'Pending'),
(10, 10, 10, 10, '2024-09-24', '18:00:00', 'Pending');

CREATE TABLE Vaccinations (
    VaccinationID INT PRIMARY KEY,
    UserID INT,
    VaccineID INT,
    DoseNumber INT,
    VaccinationDate DATE,
    CenterID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (VaccineID) REFERENCES Vaccines(VaccineID),
    FOREIGN KEY (CenterID) REFERENCES Centers(CenterID)
);

INSERT INTO Vaccinations (VaccinationID, UserID, VaccineID, DoseNumber, VaccinationDate, CenterID)
VALUES 
(1, 1, 1, 1, '2024-09-15', 1),
(2, 2, 2, 1, '2024-09-16', 2),
(3, 3, 3, 1, '2024-09-17', 3),
(4, 4, 4, 1, '2024-09-18', 4),
(5, 5, 5, 1, '2024-09-19', 5),
(6, 6, 6, 1, '2024-09-20', 6),
(7, 7, 7, 1, '2024-09-21', 7),
(8, 8, 8, 1, '2024-09-22', 8),
(9, 9, 9, 1, '2024-09-23', 9),
(10, 10, 10, 1, '2024-09-24', 10);
select * from Users
select * from Vaccines
select * from Appointments
select * from Vaccinations

/*Find the total number of appointments for each vaccine type (identified by VaccineName).*/
SELECT v.VaccineName, COUNT(*) AS TotalAppointments FROM Vaccine v 
INNER JOIN Appointments a ON v.VaccineID = a.VaccineID                                                  
GROUP BY v.VaccineName;
 
/*Find the full name (first and last name) of users who have appointments at centers located in Bangalore.*/
SELECT CONCAT(u.First_Name, ' ', u.Last_Name) AS FullName, c.CenterName
FROM Users u
INNER JOIN Appointments a ON u.UserID = a.UserID
INNER JOIN Centers c ON a.CenterID = c.CenterID
WHERE c.Address LIKE '%Bangalore%';

 
/*Find the names of all vaccines (VaccineName) required for more than one dose (DosesRequired > 1).*/
SELECT VaccineName
FROM Vaccines
WHERE DosesRequired > 1;

 
/*List all appointments along with the corresponding user's name (using CONCAT) and the vaccine name.*/
SELECT a.AppointmentID, CONCAT(u.First_Name, ' ', u.Last_Name) AS UserName, v.VaccineName
FROM Appointments a
INNER JOIN Users u ON a.UserID = u.UserID
INNER JOIN Vaccines v ON a.VaccineID = v.VaccineID;
