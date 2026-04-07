-- Name: Marcellus Hall
-- No Laces
-- Milestone 2.2: SQL Queries

CREATE DATABASE Sneakerstore;
USE Sneakerstore;
CREATE TABLE UserAccount(
    User_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('Customer', 'Staff', 'Admin') NOT NULL DEFAULT 'Customer',
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    Zip_code VARCHAR(10) NOT NULL,
    Shoe_size DECIMAL(4,1) NOT NULL
);

CREATE TABLE Sneaker(
    Product_id INT AUTO_INCREMENT PRIMARY KEY,
    Model_name VARCHAR(100) NOT NULL,
    Silhouette_type VARCHAR(50) NOT NULL,
    Brand VARCHAR(50) NOT NULL,
    Colorway VARCHAR(100) NOT NULL,
    SKU VARCHAR(50) NOT NULL UNIQUE,
    Release_date DATE,
    Base_price DECIMAL(10,2) NOT NULL,
    Image_URL VARCHAR(500) NOT NULL
);
CREATE TABLE SneakerInventory(
    Inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    Product_id INT NOT NULL,
    Size Decimal(4,1) NOT NULL,
    Quantity INT NOT NULL CHECK (quantity >= 0),
    UNIQUE(Product_id, Size),
    FOREIGN KEY(Product_id)
    	REFERENCES Sneaker(Product_id)
    	ON DELETE CASCADE
);
CREATE TABLE Cart(
    Cart_id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(User_id)
    	REFERENCES UserAccount(User_id)
    	ON DELETE CASCADE
);
CREATE TABLE CartItem(
    Cart_Item_id INT AUTO_INCREMENT PRIMARY KEY,
    Cart_id INT NOT NULL,
    Inventory_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (quantity = 1),
    UNIQUE(Cart_id, Inventory_id),
    FOREIGN KEY(Cart_id)
    	REFERENCES Cart(Cart_id)
    	ON DELETE CASCADE,
    FOREIGN KEY (Inventory_id)
    	REFERENCES SneakerInventory(Inventory_id)
    	ON DELETE CASCADE
);
CREATE TABLE WishList(
    WishList_id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT NOT NULL,
    Name VARCHAR(100) NOT NULL DEFAULT 'Grails',
    FOREIGN KEY (User_id)
    	REFERENCES UserAccount(User_id)
    	ON DELETE CASCADE
);
CREATE TABLE WishListItem(
    WishList_item_id INT AUTO_INCREMENT PRIMARY KEY,
    WishList_id INT NOT NULL,
    Inventory_id INT NOT NULL,
    UNIQUE(WishList_id, Inventory_id),
    FOREIGN KEY(WishList_id)
    	REFERENCES WishList(WishList_id)
    	ON DELETE CASCADE,
    
    FOREIGN KEY(Inventory_id)
    	REFERENCES SneakerInventory(Inventory_id)
    	ON DELETE CASCADE
);
CREATE TABLE OrderTable(
    Order_id INT AUTO_INCREMENT PRIMARY KEY,
    User_id INT NOT NULL,
    Order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total_amount Decimal(10,2) NOT NULL,
    FOREIGN KEY (User_id)
    	REFERENCES UserAccount(User_id)
    	ON DELETE CASCADE
);
CREATE TABLE OrderItem(
    Order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    Order_id INT NOT NULL,
    Inventory_id INT NOT NULL,
    Quantity INT NOT NULL CHECK(quantity = 1),
    Price_at_purchase DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(Order_id)
    	REFERENCES OrderTable(Order_id)
    	ON DELETE CASCADE,
    
    FOREIGN KEY(Inventory_id)
    	REFERENCES SneakerInventory(Inventory_id)
    	ON DELETE CASCADE
);

INSERT INTO UserAccount (First_name, Last_name, Email, Password, Role, Street, City, State, Zip_code, Shoe_size)
	VALUES('Michael', 'Hunter', 'm.hunter88@outlook.com', 'HunterM_2024!', 'Customer', '1200 Pratt St', 'Baltimore', 'MD', '21201', 10.5),
	('Alicia', 'Reed', 'Alicia.reed.design@gmail.com', 'BlueSky#Reed92', 'Customer', '55 Light St', 'Baltimore', 'MD', '21202', 7.5),
	('Jordan', 'Cole', 'Jcole_solutions@icloud.com', 'ColeJ_Secure8!', 'Customer', '900 Orleans St', 'Baltimore', 'MD', '21287', 11.0),
	('Samantha', 'Lee', 'samantha.lee22@yahoo.com', 'SunnyDay@Lee44', 'Staff', '300 Charles St', 'Baltimore', 'MD', '21218', 8.0),
	('Marcus', 'Wright', 'm_wright_tech@protonmail.com', 'Wright_M@Pass9', 'Admin', '88 Fayette St', 'Baltimore', 'MD', '21201', 12.0),
	('Emily', 'Stone', 'emily.stone.edu@gmail.com', 'StoneE_Maple7#', 'Customer', '10 Eager St', 'Baltimore', 'MD', '21205', 6.5),
	('David', 'Nguyen', 'dnguyen_05@me.com', 'NguyenD_99!vid', 'customer', '400 Madison St', 'Baltimore', 'MD', '21231', 9.0),
	('Rachel', 'Kim', 'rkim_consulting@outlook.com', 'RachelK_Star#21', 'Customer', '700 Lombard St', 'Baltimore', 'MD', '21201', 8.5),
	('Anthony', 'Brown', 'anthony.brown85@gmail.com', 'BrownA_Bridge5!', 'Customer', '1500 York Rd', 'Baltimore', 'MD', '21204', 13.0),
	('Sophia', 'Martinez', 'sophia.m.martinez@live.com', 'MartinezS@77Gold', 'Customer', '2000 Liberty Rd', 'Baltimore', 'MD', '21244', 7.0);
   
INSERT INTO Sneaker 
(Model_name, Silhouette_type, Brand, Colorway, SKU, Release_date, Base_price, Image_URL)
VALUES
('Air Jordan 1', 'Basketball', 'Jordan', 'Chicago', 'AJ1-CHI-001', '2015-05-30', 170.00, 'https://upload.wikimedia.org/wikipedia/commons/3/3e/Air_Jordan_1_Chicago.jpg'),
('Air Force 1', 'Lifestyle', 'Nike', 'Triple White', 'AF1-WHT-002', '2007-01-01', 100.00, 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Nike_Air_Force_1_07_White.jpg'),
('Yeezy Boost 350 V2', 'Lifestyle', 'Adidas', 'Zebra', 'YZ350-ZEB-003', '2017-02-25', 220.00, 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Adidas_Yeezy_Boost_350_V2_Zebra.jpg'),
('Nike Dunk Low', 'Skateboarding', 'Nike', 'Panda', 'DNK-PND-004', '2021-03-10', 110.00, 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Nike_Dunk_Low_Panda.jpg'),
('Air Jordan 4', 'Basketball', 'Jordan', 'Bred', 'AJ4-BRD-005', '2019-05-04', 200.00, 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Air_Jordan_IV_Bred_2019.jpg'),
('Air Jordan 11', 'Basketball', 'Jordan', 'Concord', 'AJ11-CON-006', '2018-12-08', 220.00, 'https://upload.wikimedia.org/wikipedia/commons/8/8b/Air_Jordan_11_Concord_2018.jpg'),
('New Balance 550', 'Lifestyle', 'New Balance', 'White Green', 'NB550-WG-007', '2020-09-01', 110.00, 'https://upload.wikimedia.org/wikipedia/commons/6/6c/New_Balance_550_White_Green.jpg'),
('Adidas Foam Runner', 'Lifestyle', 'Adidas', 'Sand', 'FR-SND-008', '2021-06-01', 90.00, 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Adidas_Yeezy_Foam_Runner_Sand.jpg'),
('Nike Air Max 97', 'Running', 'Nike', 'Silver Bullet', 'AM97-SB-009', '2017-04-13', 175.00, 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Nike_Air_Max_97_Silver_Bullet.jpg'),
('Kobe 6', 'Basketball', 'Nike', 'Grinch', 'KB6-GRN-010', '2010-12-25', 180.00, 'https://upload.wikimedia.org/wikipedia/commons/7/7d/Nike_Kobe_6_Grinch.jpg');

INSERT INTO SneakerInventory (Product_id, Size, Quantity)
VALUES(1, 10.5, 5),
	(2, 9.0, 12),
	(3, 11.0, 3),
	(4, 8.0, 7),
	(5, 11.5, 2),
	(6, 10.0, 4),
	(7, 9.5, 6);

INSERT INTO Cart (User_id)
VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO CartItem (Cart_id, Inventory_id, Quantity)
VALUES(1, 1, 1),
	(1, 3, 1),
	(2, 2, 1),
	(3, 4, 1),
	(4, 5, 1),
	(5, 6, 1),
	(6, 7, 1);

INSERT INTO WishList (User_id, Name)
VALUES(1, 'Grails'),
	(2, 'Summer Picks'),
	(3, 'Favorites'),
	(4, 'Future Cops'),
	(5, 'Staff Picks'),
	(6, 'Organizer List'),
	(8, 'Shoe List'),
	(8, 'Holey Sole Temple'),
	(9, 'Kim Kicks'),
	(10, 'Ant Boots');

INSERT INTO WishListItem (wishlist_id, inventory_id)
VALUES(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7);

INSERT INTO OrderTable (User_id, Total_Amount)
VALUES(1, 310.00),
	(2, 220.00),
	(3, 110.00),
	(4, 200.00),
	(5, 175.00),
	(6, 90.00),
	(7, 110.00),
	(8, 220.00),
	(9, 180.00),
	(10, 100.00);

INSERT INTO OrderItem (Order_id, Inventory_id, Quantity, Price_at_purchase)
	VALUES(1, 1, 1, 170.00),
    (2, 2, 1, 140.00),
	(3, 3, 1, 220.00),
	(4, 4, 1, 110.00),
	(5, 5, 1, 200.00),
	(6, 6, 1, 175.00),
	(7, 7, 1, 90.00);

-- Query 1: Display all records from SneakerInventory table
SELECT * FROM SneakerInventory;

-- Query 2: Show all the brand records from the Sneaker table.
SELECT Brand FROM Sneaker;

-- Query 3: Show all the email addresses from the UserAccount table.
SELECT Email FROM UserAccount;

-- Query 4: Show all shoe names that have the colorway name of Chicago in the Sneaker table.
SELECT Model_name FROM Sneaker
WHERE Colorway = 'Chicago';

-- Query 5: Show all sneaker model and colorway names that cost more than $100.00
SELECT Model_name, Colorway FROM Sneaker
WHERE Base_price > 100.00;

-- Query 6: Show all users from user account who's name starts with an M.
SELECT First_name, Last_name FROM UserAccount
WHERE First_name LIKE 'M%';

-- Query 7: Show the model name, colorway name, and base price for the shoes in the sneaker table by base price in descending order.
SELECT Model_name, Colorway, Base_price 
FROM Sneaker 
ORDER BY Base_Price DESC;

-- Query 8: Show colorway name and base price for shoes in ascending order.
SELECT Colorway, Base_price
FROM Sneaker
ORDER BY Base_price ASC;

-- Query 9: Show all the non null values in the email column.
SELECT COUNT(Email)
FROM UserAccount;

-- Query 10: Show the average price from the base price column in the sneaker table.
SELECT AVG(Base_price)
FROM Sneaker;

-- Query 11: Show the sum value for the quantity of shoes in the sneaker inventory table.
SELECT SUM(Quantity)
FROM SneakerInventory;

-- Query 12: Group each sneaker by brand and then show the count for each.
SELECT Brand, COUNT(*) AS sneaker_count
FROM Sneaker
GROUP BY Brand;

-- Query 13: Show how many items are in each wishlist.
SELECT WishList_id, COUNT(*) AS total_items
FROM WishListItem
GROUP BY WishList_id;

-- Query 14: Show each user and how many items are in their cart.
SELECT 
    UserAccount.First_name,
    UserAccount.Last_name,
    COUNT(CartItem.Cart_item_id) AS total_items
FROM UserAccount
JOIN Cart 
    ON UserAccount.User_id = Cart.User_id
LEFT JOIN CartItem 
    ON Cart.Cart_id = CartItem.Cart_id
GROUP BY UserAccount.User_id;

-- Query 15: Update the street address for Jordan Cole.
UPDATE UserAccount
SET Street = '500 New Street',
    City = 'Baltimore',
    State = 'MD',
    Zip_code = '21215'
WHERE User_id = 3;

-- Query 16: Update the inventory stock of the Nike Dunk Low in a Size 8.0.
UPDATE SneakerInventory
SET Quantity = 20
WHERE Inventory_id = 4;

-- Query 17: Delete the wish list named "Shoe List".
DELETE FROM WishList
WHERE WishList_id = 6;

-- Query 18: Delete the 5th cart item.
DELETE FROM CartItem
WHERE Cart_item_id = 5;
