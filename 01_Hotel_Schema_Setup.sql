-- USERS TABLE
CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address TEXT
);

INSERT INTO users VALUES
('21wrcxuy-67erfn','John Doe','97XXXXXXX','john.doe@example.com','XX Street'),
('45tyuiop-98lkjh','Alice Smith','98XXXXXXX','alice@example.com','YY Street'),
('78asdfgh-12zxcv','Bob Brown','99XXXXXXX','bob@example.com','ZZ Street');
-- BOOKINGS TABLE
CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date TIMESTAMP,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

INSERT INTO bookings VALUES
('bk-09f3e-95hj','2021-09-23 07:36:48','rm-bhf9-aerjn','21wrcxuy-67erfn'),
('bk-q034-q4o','2021-09-23 08:15:30','rm-x7y8-z9a0','45tyuiop-98lkjh'),
('bk-1a2b-3c4d','2021-10-05 09:00:00','rm-a1b2-c3d4','78asdfgh-12zxcv'),
('bk-7g6h-5j4k','2021-11-12 18:00:00','rm-e5f6-g7h8','21wrcxuy-67erfn');

-- ITEMS TABLE
CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate INT
);

INSERT INTO items VALUES
('itm-a9e8-q8fu','Tawa Paratha',18),
('itm-a07vh-aer8','Mix Veg',89),
('itm-w978-23u4','Paneer Butter Masala',150),
('itm-x1y2-z3a4','Dal Fry',120),
('itm-b5c6-d7e8','Jeera Rice',90);

-- BOOKING COMMERCIALS
CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date TIMESTAMP,
    item_id VARCHAR(50),
    item_quantity INT
);

INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('q3o4-ahf32-o2u4','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1),
('134lr-oyfo8-3qk4','bk-q034-q4o','bl-34qhd-r7h8','2021-09-23 12:05:37','itm-w978-23u4',0.5),
('a12b-x9k3-1pqr','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:10:10','itm-a9e8-q8fu',2),
('b98c-z7n1-2lmn','bk-1a2b-3c4d','bl-9x8y7-z6w5','2021-10-05 09:15:00','itm-a07vh-aer8',4),
('c56d-k3j2-8hgf','bk-1a2b-3c4d','bl-9x8y7-z6w5','2021-10-05 09:15:00','itm-w978-23u4',1.5),
('d78e-p0o9-7ytr','bk-7g6h-5j4k','bl-1q2w3-e4r5','2021-11-12 18:30:45','itm-a9e8-q8fu',6),
('e11f-l2k3-6mnb','bk-7g6h-5j4k','bl-1q2w3-e4r5','2021-11-12 18:30:45','itm-a07vh-aer8',3);