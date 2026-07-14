CREATE DATABASE InsuranceDB;
USE InsuranceDB;
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(50),
    Branch_Address VARCHAR(100)
);
INSERT INTO Branch (Branch_ID, Branch_Name, Branch_Address) VALUES
(1, 'Chennai Branch', 'Anna Nagar, Chennai'),
(2, 'Coimbatore Branch', 'Gandhipuram, Coimbatore'),
(3, 'Madurai Branch', 'KK Nagar, Madurai'),
(4, 'Trichy Branch', 'Cantonment, Trichy'),
(5, 'Salem Branch', 'Fairlands, Salem');
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Designation VARCHAR(50),
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
INSERT INTO Employee (Employee_ID, Employee_Name, Designation, Branch_ID) VALUES
(101, 'Arun Kumar', 'Manager', 1),
(102, 'Priya Sharma', 'Assistant Manager', 1),
(103, 'Karthik Raj', 'Cashier', 2),
(104, 'Divya S', 'Customer Executive', 2),
(105, 'Rahul Kumar', 'Manager', 3),
(106, 'Anitha R', 'Insurance Officer', 3),
(107, 'Vignesh P', 'Sales Executive', 4),
(108, 'Nisha M', 'Customer Executive', 4),
(109, 'Suresh Babu', 'Branch Manager', 5),
(110, 'Keerthana V', 'Accountant', 5);
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);
INSERT INTO Customer (Customer_ID, Customer_Name, Gender, Phone, Address) VALUES
(1001,'Arun Kumar','Male','9876543210','Chennai'),
(1002,'Priya Sharma','Female','9876543211','Coimbatore'),
(1003,'Rahul Raj','Male','9876543212','Madurai'),
(1004,'Divya S','Female','9876543213','Trichy'),
(1005,'Karthik M','Male','9876543214','Salem'),
(1006,'Anitha R','Female','9876543215','Erode'),
(1007,'Vignesh P','Male','9876543216','Tiruppur'),
(1008,'Nisha K','Female','9876543217','Karur'),
(1009,'Suresh Babu','Male','9876543218','Namakkal'),
(1010,'Keerthana V','Female','9876543219','Vellore'),
(1011,'Ajith Kumar','Male','9876543220','Chennai'),
(1012,'Meena Devi','Female','9876543221','Madurai'),
(1013,'Prakash R','Male','9876543222','Coimbatore'),
(1014,'Lakshmi P','Female','9876543223','Salem'),
(1015,'Hari Krishnan','Male','9876543224','Trichy'),
(1016,'Pavithra S','Female','9876543225','Erode'),
(1017,'Ramesh Kumar','Male','9876543226','Karur'),
(1018,'Gayathri M','Female','9876543227','Tiruppur'),
(1019,'Santhosh K','Male','9876543228','Namakkal'),
(1020,'Deepika R','Female','9876543229','Vellore');
CREATE TABLE Agent (
    Agent_ID INT PRIMARY KEY,
    Agent_Name VARCHAR(50),
    Phone VARCHAR(15),
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
INSERT INTO Agent (Agent_ID, Agent_Name, Phone, Branch_ID) VALUES
(201, 'Ravi Kumar', '9876500001', 1),
(202, 'Priya Devi', '9876500002', 1),
(203, 'Karthik Raj', '9876500003', 2),
(204, 'Anitha S', '9876500004', 2),
(205, 'Vignesh Kumar', '9876500005', 3),
(206, 'Nisha R', '9876500006', 3),
(207, 'Suresh Babu', '9876500007', 4),
(208, 'Meena Lakshmi', '9876500008', 4),
(209, 'Prakash M', '9876500009', 5),
(210, 'Divya K', '9876500010', 5);
CREATE TABLE Policy_Type (
    PolicyType_ID INT PRIMARY KEY,
    Policy_Name VARCHAR(50),
    Coverage_Amount DECIMAL(10,2),
    Duration INT
);
INSERT INTO Policy_Type (PolicyType_ID, Policy_Name, Coverage_Amount, Duration) VALUES
(301, 'Life Insurance', 500000.00, 20),
(302, 'Health Insurance', 300000.00, 10),
(303, 'Vehicle Insurance', 200000.00, 5),
(304, 'Home Insurance', 400000.00, 15),
(305, 'Travel Insurance', 100000.00, 1);
CREATE TABLE Policy (
    Policy_ID INT PRIMARY KEY,
    Customer_ID INT,
    Agent_ID INT,
    PolicyType_ID INT,
    Start_Date DATE,
    End_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Agent_ID) REFERENCES Agent(Agent_ID),
    FOREIGN KEY (PolicyType_ID) REFERENCES Policy_Type(PolicyType_ID)
);
INSERT INTO Policy (Policy_ID, Customer_ID, Agent_ID, PolicyType_ID, Start_Date, End_Date) VALUES
(401,1001,201,301,'2026-01-10','2046-01-09'),
(402,1002,202,302,'2026-02-15','2036-02-14'),
(403,1003,203,303,'2026-03-20','2031-03-19'),
(404,1004,204,304,'2026-04-05','2041-04-04'),
(405,1005,205,305,'2026-05-12','2027-05-11'),
(406,1006,206,301,'2026-06-18','2046-06-17'),
(407,1007,207,302,'2026-07-25','2036-07-24'),
(408,1008,208,303,'2026-08-08','2031-08-07'),
(409,1009,209,304,'2026-09-14','2041-09-13'),
(410,1010,210,305,'2026-10-01','2027-09-30'),
(411,1011,201,301,'2026-10-15','2046-10-14'),
(412,1012,202,302,'2026-11-05','2036-11-04'),
(413,1013,203,303,'2026-11-20','2031-11-19'),
(414,1014,204,304,'2026-12-10','2041-12-09'),
(415,1015,205,305,'2026-12-22','2027-12-21'),
(416,1016,206,301,'2027-01-08','2047-01-07'),
(417,1017,207,302,'2027-02-14','2037-02-13'),
(418,1018,208,303,'2027-03-03','2032-03-02'),
(419,1019,209,304,'2027-03-25','2042-03-24'),
(420,1020,210,305,'2027-04-12','2028-04-11');
CREATE TABLE Nominee (
    Nominee_ID INT PRIMARY KEY,
    Customer_ID INT,
    Nominee_Name VARCHAR(50),
    Relation VARCHAR(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO Nominee (Nominee_ID, Customer_ID, Nominee_Name, Relation) VALUES
(501,1001,'Lakshmi Kumar','Wife'),
(502,1002,'Ramesh Sharma','Husband'),
(503,1003,'Priya Raj','Wife'),
(504,1004,'Arun Kumar','Husband'),
(505,1005,'Meena Karthik','Wife'),
(506,1006,'Suresh R','Husband'),
(507,1007,'Anitha V','Wife'),
(508,1008,'Prakash M','Father'),
(509,1009,'Deepa Babu','Wife'),
(510,1010,'Ravi Kumar','Father'),
(511,1011,'Nisha Ajith','Wife'),
(512,1012,'Murugan D','Husband'),
(513,1013,'Divya Prakash','Wife'),
(514,1014,'Selvam P','Father'),
(515,1015,'Keerthana Hari','Wife'),
(516,1016,'Mahesh R','Brother'),
(517,1017,'Kavitha Kumar','Wife'),
(518,1018,'Sathish M','Brother'),
(519,1019,'Gayathri K','Sister'),
(520,1020,'Ramesh R','Father');
CREATE TABLE Premium_Payment (
    Payment_ID INT PRIMARY KEY,
    Policy_ID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
INSERT INTO Premium_Payment (Payment_ID, Policy_ID, Amount, Payment_Date) VALUES
(601,401,25000.00,'2026-01-15'),
(602,402,18000.00,'2026-02-20'),
(603,403,12000.00,'2026-03-25'),
(604,404,22000.00,'2026-04-10'),
(605,405,8000.00,'2026-05-18'),
(606,406,25000.00,'2026-06-22'),
(607,407,18000.00,'2026-07-28'),
(608,408,12000.00,'2026-08-12'),
(609,409,22000.00,'2026-09-18'),
(610,410,8000.00,'2026-10-05'),
(611,411,25000.00,'2026-10-20'),
(612,412,18000.00,'2026-11-10'),
(613,413,12000.00,'2026-11-25'),
(614,414,22000.00,'2026-12-15'),
(615,415,8000.00,'2026-12-28'),
(616,416,25000.00,'2027-01-12'),
(617,417,18000.00,'2027-02-18'),
(618,418,12000.00,'2027-03-08'),
(619,419,22000.00,'2027-03-30'),
(620,420,8000.00,'2027-04-18');
CREATE TABLE Claim (
    Claim_ID INT PRIMARY KEY,
    Policy_ID INT,
    Claim_Date DATE,
    Claim_Status VARCHAR(30),
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
INSERT INTO Claim (Claim_ID, Policy_ID, Claim_Date, Claim_Status) VALUES
(701,401,'2026-03-12','Approved'),
(702,402,'2026-04-18','Pending'),
(703,403,'2026-05-10','Rejected'),
(704,404,'2026-06-22','Approved'),
(705,405,'2026-07-15','Pending'),
(706,406,'2026-08-08','Approved'),
(707,407,'2026-09-14','Rejected'),
(708,408,'2026-10-20','Approved'),
(709,409,'2026-11-18','Pending'),
(710,410,'2026-12-05','Approved'),
(711,411,'2027-01-16','Rejected'),
(712,412,'2027-02-12','Approved'),
(713,413,'2027-03-08','Pending'),
(714,414,'2027-04-25','Approved'),
(715,415,'2027-05-14','Rejected'),
(716,416,'2027-06-10','Approved'),
(717,417,'2027-07-18','Pending'),
(718,418,'2027-08-09','Approved'),
(719,419,'2027-09-22','Rejected'),
(720,420,'2027-10-15','Approved');
CREATE TABLE Claim_Document (
    Document_ID INT PRIMARY KEY,
    Claim_ID INT,
    Document_Name VARCHAR(100),
    FOREIGN KEY (Claim_ID) REFERENCES Claim(Claim_ID)
);
INSERT INTO Claim_Document (Document_ID, Claim_ID, Document_Name) VALUES
(801,701,'Medical Report'),
(802,702,'Hospital Bill'),
(803,703,'Police FIR'),
(804,704,'Vehicle Inspection Report'),
(805,705,'Repair Estimate'),
(806,706,'Discharge Summary'),
(807,707,'Death Certificate'),
(808,708,'Identity Proof'),
(809,709,'Insurance Policy Copy'),
(810,710,'Driving License'),
(811,711,'Claim Form'),
(812,712,'Medical Certificate'),
(813,713,'X-Ray Report'),
(814,714,'Passport Copy'),
(815,715,'Fire Damage Report'),
(816,716,'Invoice Copy'),
(817,717,'Bank Statement'),
(818,718,'Accident Report'),
(819,719,'Ownership Proof'),
(820,720,'Final Settlement Letter');
CREATE TABLE Vehicle (
    Vehicle_ID INT PRIMARY KEY,
    Policy_ID INT,
    Vehicle_Number VARCHAR(20),
    Model VARCHAR(50),
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
INSERT INTO Vehicle (Vehicle_ID, Policy_ID, Vehicle_Number, Model) VALUES
(901,403,'TN01AB1234','Honda City'),
(902,408,'TN02CD2345','Hyundai i20'),
(903,413,'TN03EF3456','Maruti Swift'),
(904,418,'TN04GH4567','Toyota Innova'),
(905,403,'TN05IJ5678','Kia Seltos'),
(906,408,'TN06KL6789','Tata Nexon'),
(907,413,'TN07MN7890','Mahindra XUV300'),
(908,418,'TN08OP8901','Hyundai Creta'),
(909,403,'TN09QR9012','Honda Amaze'),
(910,408,'TN10ST0123','Maruti Baleno'),
(911,413,'TN11UV1235','Toyota Glanza'),
(912,418,'TN12WX2346','Renault Kwid'),
(913,403,'TN13YZ3457','Nissan Magnite'),
(914,408,'TN14AA4568','MG Hector'),
(915,413,'TN15BB5679','Skoda Slavia'),
(916,418,'TN16CC6780','Volkswagen Virtus'),
(917,403,'TN17DD7891','Ford EcoSport'),
(918,408,'TN18EE8902','Hyundai Venue'),
(919,413,'TN19FF9013','Tata Punch'),
(920,418,'TN20GG0124','Mahindra Thar');
CREATE TABLE Policy_Renewal (
    Renewal_ID INT PRIMARY KEY,
    Policy_ID INT,
    Renewal_Date DATE,
    FOREIGN KEY (Policy_ID) REFERENCES Policy(Policy_ID)
);
INSERT INTO Policy_Renewal (Renewal_ID, Policy_ID, Renewal_Date) VALUES
(1001,401,'2027-01-10'),
(1002,402,'2027-02-15'),
(1003,403,'2027-03-20'),
(1004,404,'2027-04-05'),
(1005,405,'2027-05-12'),
(1006,406,'2027-06-18'),
(1007,407,'2027-07-25'),
(1008,408,'2027-08-08'),
(1009,409,'2027-09-14'),
(1010,410,'2027-10-01'),
(1011,411,'2027-10-15'),
(1012,412,'2027-11-05'),
(1013,413,'2027-11-20'),
(1014,414,'2027-12-10'),
(1015,415,'2027-12-22'),
(1016,416,'2028-01-08'),
(1017,417,'2028-02-14'),
(1018,418,'2028-03-03'),
(1019,419,'2028-03-25'),
(1020,420,'2028-04-12');
CREATE TABLE Payment (
    PaymentRef_ID INT PRIMARY KEY,
    Payment_ID INT,
    Payment_Mode VARCHAR(20),
    FOREIGN KEY (Payment_ID) REFERENCES Premium_Payment(Payment_ID)
);
INSERT INTO Payment (PaymentRef_ID, Payment_ID, Payment_Mode) VALUES
(1101,601,'UPI'),
(1102,602,'Credit Card'),
(1103,603,'Debit Card'),
(1104,604,'Net Banking'),
(1105,605,'Cash'),
(1106,606,'UPI'),
(1107,607,'Credit Card'),
(1108,608,'Debit Card'),
(1109,609,'Net Banking'),
(1110,610,'Cash'),
(1111,611,'UPI'),
(1112,612,'Credit Card'),
(1113,613,'Debit Card'),
(1114,614,'Net Banking'),
(1115,615,'Cash'),
(1116,616,'UPI'),
(1117,617,'Credit Card'),
(1118,618,'Debit Card'),
(1119,619,'Net Banking'),
(1120,620,'Cash');
CREATE TABLE Invoice (
    Invoice_ID INT PRIMARY KEY,
    PaymentRef_ID INT,
    Invoice_Date DATE,
    FOREIGN KEY (PaymentRef_ID) REFERENCES Payment(PaymentRef_ID)
);
INSERT INTO Invoice (Invoice_ID, PaymentRef_ID, Invoice_Date) VALUES
(1201,1101,'2026-01-15'),
(1202,1102,'2026-02-20'),
(1203,1103,'2026-03-25'),
(1204,1104,'2026-04-10'),
(1205,1105,'2026-05-18'),
(1206,1106,'2026-06-22'),
(1207,1107,'2026-07-28'),
(1208,1108,'2026-08-12'),
(1209,1109,'2026-09-18'),
(1210,1110,'2026-10-05'),
(1211,1111,'2026-10-20'),
(1212,1112,'2026-11-10'),
(1213,1113,'2026-11-25'),
(1214,1114,'2026-12-15'),
(1215,1115,'2026-12-28'),
(1216,1116,'2027-01-12'),
(1217,1117,'2027-02-18'),
(1218,1118,'2027-03-08'),
(1219,1119,'2027-03-30'),
(1220,1120,'2027-04-18');
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY,
    Customer_ID INT,
    Rating INT,
    Comments VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO Feedback (Feedback_ID, Customer_ID, Rating, Comments) VALUES
(1301,1001,5,'Excellent Service'),
(1302,1002,4,'Good Support'),
(1303,1003,3,'Average Experience'),
(1304,1004,5,'Fast Claim Settlement'),
(1305,1005,4,'Helpful Staff'),
(1306,1006,5,'Quick Premium Process'),
(1307,1007,2,'Delay in Claim Approval'),
(1308,1008,4,'Satisfied with Policy'),
(1309,1009,5,'Excellent Customer Care'),
(1310,1010,3,'Need Better Support'),
(1311,1011,4,'Easy Renewal Process'),
(1312,1012,5,'Very Good Experience'),
(1313,1013,3,'Average Response'),
(1314,1014,4,'Friendly Staff'),
(1315,1015,5,'Excellent Policy Coverage'),
(1316,1016,2,'Slow Documentation'),
(1317,1017,4,'Good Claim Service'),
(1318,1018,5,'Highly Recommended'),
(1319,1019,3,'Satisfied'),
(1320,1020,4,'Good Insurance Services');
