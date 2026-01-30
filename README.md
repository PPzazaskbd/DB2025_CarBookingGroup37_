# Car Rental Management System (`CarBookingGroup37`)

This repository contains the PostgreSQL database schema for a **Car Rental Management System**. The system manages a fleet of vehicles across multiple shop locations, tracks customer eligibility via driver's licenses, and logs the full lifecycle of rental transactions.

## 🛠 Database Specifications
* **Engine:** PostgreSQL 18
* **Encoding:** UTF-8 (65001)
* **Export Tool:** Navicat Premium
* **Primary Features:** Relational integrity, audit logging, and multi-shop support.

---

## 📂 Database Schema Overview

The database is structured into three primary modules to ensure data integrity and operational clarity:

### 1. User & Authentication
* **`administator`**: Stores admin profiles and credentials for system oversight.
* **`customer`**: Central table for user accounts, including unique driver's license linkage.
* **`driver_license`**: Validates customer eligibility with expiration dates and DOB tracking.
* **`logs`**: An audit trail of customer login/logout activity with boolean status.
* **`phone_number`**: Manages primary, secondary, and emergency contact numbers per customer.

### 2. Fleet & Shop Management
* **`car`**: Physical asset tracking (mileage, production year, plate number).
* **`car_info`**: Technical specifications and pricing (fuel type, transmission, price per day).
* **`shop`**: High-level shop data including operating hours and price ranges.
* **`shop_desc`**: Detailed location data (address, district, province, and postal code).
* **`Manage`**: Junction table linking administrators to specific shops they manage.

### 3. Rental Transactions
* **`Rental`**: The core operational table. It bridges customers, cars, and shops.
    * Tracks pickup/return dates and locations (Pickup Shop vs. Return Shop).
    * Records mileage usage (`mileage_start` to `mileage_end`).
    * Applies discounts and calculates daily rates.

---

## 🚀 Getting Started

### Prerequisites
* PostgreSQL 18 or higher installed.
* An SQL client (pgAdmin, DBeaver, or command line).

### Installation
1. **Create the Database:**
   ```sql
   CREATE DATABASE "CarBookingGroup37";

---
### ERD diagram 
<img width="1634" height="917" alt="ERD Diagram from Pgadmin" src="https://github.com/user-attachments/assets/faa86517-5fa0-429b-80ff-7dc1b88b8e94" />
