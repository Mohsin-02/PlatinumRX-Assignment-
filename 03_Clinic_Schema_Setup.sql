-- CLINIC SETUP

CREATE TABLE clinics (
    cid TEXT,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);

INSERT INTO clinics VALUES
('c1','ClinicA','Hyderabad','TS','India'),
('c2','ClinicB','Hyderabad','TS','India'),
('c3','ClinicC','Chennai','TN','India');

CREATE TABLE clinic_sales (
    oid TEXT,
    uid TEXT,
    cid TEXT,
    amount INTEGER,
    datetime TEXT,
    sales_channel TEXT
);

INSERT INTO clinic_sales VALUES
('o1','u1','c1',5000,'2021-01-10','online'),
('o2','u2','c1',7000,'2021-01-15','offline'),
('o3','u3','c2',3000,'2021-01-20','online'),
('o4','u1','c2',8000,'2021-02-10','offline'),
('o5','u2','c3',6000,'2021-02-12','online'),
('o6','u3','c3',4000,'2021-02-18','offline');

CREATE TABLE expenses (
    eid TEXT,
    cid TEXT,
    description TEXT,
    amount INTEGER,
    datetime TEXT
);

INSERT INTO expenses VALUES
('e1','c1','medicine',2000,'2021-01-10'),
('e2','c2','rent',1000,'2021-01-15'),
('e3','c3','staff',1500,'2021-01-20'),
('e4','c1','maintenance',2500,'2021-02-10'),
('e5','c2','electricity',1200,'2021-02-12'),
('e6','c3','equipment',1800,'2021-02-18');