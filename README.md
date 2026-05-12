# Sneaker Catalog Database System

## Overview
The **Sneaker Catalog Database System** is a full‑stack PHP/MySQL e‑commerce application that allows users to browse sneakers, manage accounts, add items to a cart, update account information, and interact with a dynamic inventory system. The project includes authentication, cart logic, database integration, and a clean UI.

This repository contains all backend PHP files, frontend styling, images, and the SQL schema needed to run the application locally.

---

## Features
- User authentication (signup, login, logout)
- Account management (update account details)
- Dynamic sneaker catalog with images
- Add‑to‑cart and remove‑from‑cart functionality
- Shopping cart page with quantity and item management
- Dashboard for logged‑in users
- MySQL database integration
- Organized folder structure for easy navigation

---

## Tech Stack
- **Backend:** PHP  
- **Frontend:** HTML, CSS  
- **Database:** MySQL (Sneakerstore.sql included)  
- **Server:** XAMPP / WAMP / Local PHP server  
- **Version Control:** Git + GitHub  

---

## Project Structure
No_Laces/
│   account.php
│   add_to_cart.php
│   cart.php
│   dashboard.php
│   database.php
│   login.php
│   logout.php
│   remove_from_cart.php
│   signup.php
│   update_account.php
│   style.css
│   Sneakerstore.sql
│
│── images/
│     (all sneaker images)
│
└── README.md (optional project‑specific readme)

The main repository also includes a top‑level `README.md` (this file).

---

## Setup Instructions

### 1. Import the Database
- Open phpMyAdmin  
- Create a new database (e.g., `sneakerstore`)  
- Import the file:  
No_Laces/Sneakerstore.sql

### 2. Configure Database Connection
Open `database.php` and update your local credentials:
$host = "localhost";
$user = "root";
$pass = "";
$db = "sneakerstore";

### 3. Run the Project
Place the `No_Laces` folder inside your server directory:

- For XAMPP: `htdocs/`
- For WAMP: `www/`

Then open in your browser:
http://localhosst/No_Laces/login.php

---

## File Descriptions
- **account.php** — User account page  
- **add_to_cart.php** — Adds items to the cart  
- **cart.php** — Displays and manages the shopping cart  
- **dashboard.php** — User dashboard after login  
- **database.php** — Database connection file  
- **login.php** — Login page  
- **logout.php** — Logs the user out  
- **remove_from_cart.php** — Removes items from the cart  
- **signup.php** — User registration  
- **update_account.php** — Allows users to update their account info  
- **style.css** — Main stylesheet  
- **Sneakerstore.sql** — Full database schema and sample data  

---

## Author
Marcellus Hall 
GitHub: https://github.com/The-C311

