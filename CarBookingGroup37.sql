/*
 Navicat Premium Dump SQL

 Source Server         : PostgreSQL 18
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : localhost:5432
 Source Catalog        : CarBookingGroup37
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 30/01/2026 13:22:37
*/


-- ----------------------------
-- Table structure for administator
-- ----------------------------
DROP TABLE IF EXISTS "public"."administator";
CREATE TABLE "public"."administator" (
  "admin_id" int4 NOT NULL DEFAULT nextval('administator_admin_id_seq'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "pwd" varchar(50) COLLATE "pg_catalog"."default",
  "fname" varchar(50) COLLATE "pg_catalog"."default",
  "lname" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "phone_number" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of administator
-- ----------------------------

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS "public"."car";
CREATE TABLE "public"."car" (
  "car_id" int4 NOT NULL DEFAULT nextval('car_car_id_seq'::regclass),
  "shop_id" int4 NOT NULL DEFAULT nextval('car_shop_id_seq'::regclass),
  "capacity" int4,
  "brand" varchar(50) COLLATE "pg_catalog"."default",
  "model" varchar(50) COLLATE "pg_catalog"."default",
  "plate_number" varchar(50) COLLATE "pg_catalog"."default",
  "car_serial" varchar(50) COLLATE "pg_catalog"."default",
  "mileage" numeric,
  "production_year" date
)
;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for car_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."car_info";
CREATE TABLE "public"."car_info" (
  "brand" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "model" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "car_option" varchar(50) COLLATE "pg_catalog"."default",
  "priceperday" numeric,
  "car_type" varchar(50) COLLATE "pg_catalog"."default",
  "color" varchar(50) COLLATE "pg_catalog"."default",
  "fuel_type" varchar(50) COLLATE "pg_catalog"."default",
  "transmission" varchar(50) COLLATE "pg_catalog"."default",
  "car_id" int4 NOT NULL DEFAULT nextval('car_info_car_id_seq'::regclass)
)
;

-- ----------------------------
-- Records of car_info
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "customer_id" int4 NOT NULL DEFAULT nextval('customer_customer_id_seq'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "pwd" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "phone_number" varchar(10) COLLATE "pg_catalog"."default",
  "dl_number" varchar(8) COLLATE "pg_catalog"."default",
  "address" varchar(100) COLLATE "pg_catalog"."default",
  "account_status" bool
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "public"."customer" VALUES (67, 'John123', 'John88', 'johndoe123@example.com', '0855555555', '00007543', '123,Some Road,Some District, Some Country', 't');

-- ----------------------------
-- Table structure for driver_license
-- ----------------------------
DROP TABLE IF EXISTS "public"."driver_license";
CREATE TABLE "public"."driver_license" (
  "customer_id" int4 NOT NULL,
  "dl_number" varchar(8) COLLATE "pg_catalog"."default" NOT NULL,
  "fname" varchar(50) COLLATE "pg_catalog"."default",
  "lname" varchar(50) COLLATE "pg_catalog"."default",
  "date_of_birth" date,
  "expire_date" date
)
;

-- ----------------------------
-- Records of driver_license
-- ----------------------------
INSERT INTO "public"."driver_license" VALUES (67, '00007543', 'John', 'Doe', '2000-01-01', '2030-12-31');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."logs";
CREATE TABLE "public"."logs" (
  "log_id" int4 NOT NULL DEFAULT nextval('logs_login_id_seq'::regclass),
  "customer_id" int4 NOT NULL DEFAULT nextval('logs_customer_id_seq'::regclass),
  "logI/0" bool DEFAULT false,
  "timestamp" timestamp(6)
)
;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO "public"."logs" VALUES (108, 67, 't', NULL);
INSERT INTO "public"."logs" VALUES (109, 67, 'f', NULL);

-- ----------------------------
-- Table structure for Manage
-- ----------------------------
DROP TABLE IF EXISTS "public"."Manage";
CREATE TABLE "public"."Manage" (
  "admin_id" int4 NOT NULL DEFAULT nextval('"Manage_admin_id_seq"'::regclass),
  "shop_id" int4 NOT NULL DEFAULT nextval('"Manage_shop_id_seq"'::regclass)
)
;

-- ----------------------------
-- Records of Manage
-- ----------------------------

-- ----------------------------
-- Table structure for phone_number
-- ----------------------------
DROP TABLE IF EXISTS "public"."phone_number";
CREATE TABLE "public"."phone_number" (
  "customer_id" int4 NOT NULL DEFAULT nextval('phone_number_customer_id_seq'::regclass),
  "primary_number" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "secondary_number" varchar(10) COLLATE "pg_catalog"."default",
  "emergency_number" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of phone_number
-- ----------------------------

-- ----------------------------
-- Table structure for Rental
-- ----------------------------
DROP TABLE IF EXISTS "public"."Rental";
CREATE TABLE "public"."Rental" (
  "customer_id" int4 NOT NULL DEFAULT nextval('"Rental_customer_id_seq"'::regclass),
  "car_id" int4 NOT NULL DEFAULT nextval('"Rental_car_id_seq"'::regclass),
  "pickup_date" date NOT NULL,
  "return_date" date NOT NULL,
  "discount" int4,
  "pickupShop_id" int4 NOT NULL DEFAULT nextval('"Rental_pickupShop_id_seq"'::regclass),
  "returnShop_id" int4 NOT NULL DEFAULT nextval('"Rental_returnShop_id_seq"'::regclass),
  "rental_status" bool,
  "mileage_start" numeric,
  "mileage_end" numeric,
  "price_per_day" numeric
)
;

-- ----------------------------
-- Records of Rental
-- ----------------------------

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS "public"."shop";
CREATE TABLE "public"."shop" (
  "shop_id" int4 NOT NULL DEFAULT nextval('shop_shop_id_seq'::regclass),
  "shop_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "phone_number" varchar(10) COLLATE "pg_catalog"."default",
  "open_time" time(6),
  "closed_time" time(6),
  "price_min" numeric,
  "price_max" numeric
)
;

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for shop_desc
-- ----------------------------
DROP TABLE IF EXISTS "public"."shop_desc";
CREATE TABLE "public"."shop_desc" (
  "shop_id" int4 NOT NULL DEFAULT nextval('shop_desc_shop_id_seq'::regclass),
  "shop_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(50) COLLATE "pg_catalog"."default",
  "map_location" varchar(10) COLLATE "pg_catalog"."default",
  "soi" varchar(50) COLLATE "pg_catalog"."default",
  "street" varchar(50) COLLATE "pg_catalog"."default",
  "sub_district" varchar(50) COLLATE "pg_catalog"."default",
  "district" varchar(50) COLLATE "pg_catalog"."default",
  "province" varchar(50) COLLATE "pg_catalog"."default",
  "postal_code" varchar(5) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of shop_desc
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table administator
-- ----------------------------
ALTER TABLE "public"."administator" ADD CONSTRAINT "administator_pkey" PRIMARY KEY ("admin_id");

-- ----------------------------
-- Uniques structure for table car
-- ----------------------------
ALTER TABLE "public"."car" ADD CONSTRAINT "UNQ.brand,model" UNIQUE ("brand", "model");

-- ----------------------------
-- Primary Key structure for table car
-- ----------------------------
ALTER TABLE "public"."car" ADD CONSTRAINT "car_pkey" PRIMARY KEY ("car_id");

-- ----------------------------
-- Primary Key structure for table car_info
-- ----------------------------
ALTER TABLE "public"."car_info" ADD CONSTRAINT "PK.car_info" PRIMARY KEY ("car_id", "model", "brand");

-- ----------------------------
-- Uniques structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "UNQ_dl_number" UNIQUE ("dl_number");
ALTER TABLE "public"."customer" ADD CONSTRAINT "UNQ_phone" UNIQUE ("phone_number");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");

-- ----------------------------
-- Uniques structure for table driver_license
-- ----------------------------
ALTER TABLE "public"."driver_license" ADD CONSTRAINT "uq_dl_number" UNIQUE ("dl_number");

-- ----------------------------
-- Primary Key structure for table driver_license
-- ----------------------------
ALTER TABLE "public"."driver_license" ADD CONSTRAINT "pk_dl" PRIMARY KEY ("customer_id", "dl_number");

-- ----------------------------
-- Primary Key structure for table logs
-- ----------------------------
ALTER TABLE "public"."logs" ADD CONSTRAINT "logs_pkey" PRIMARY KEY ("customer_id", "log_id");

-- ----------------------------
-- Primary Key structure for table Manage
-- ----------------------------
ALTER TABLE "public"."Manage" ADD CONSTRAINT "Manage_pkey" PRIMARY KEY ("admin_id", "shop_id");

-- ----------------------------
-- Uniques structure for table phone_number
-- ----------------------------
ALTER TABLE "public"."phone_number" ADD CONSTRAINT "uq_phone_number" UNIQUE ("primary_number");

-- ----------------------------
-- Primary Key structure for table phone_number
-- ----------------------------
ALTER TABLE "public"."phone_number" ADD CONSTRAINT "pk_phone" PRIMARY KEY ("customer_id", "primary_number");

-- ----------------------------
-- Primary Key structure for table Rental
-- ----------------------------
ALTER TABLE "public"."Rental" ADD CONSTRAINT "Rental_pkey" PRIMARY KEY ("customer_id", "car_id", "return_date", "pickup_date");

-- ----------------------------
-- Uniques structure for table shop
-- ----------------------------
ALTER TABLE "public"."shop" ADD CONSTRAINT "UNQ.shop_name" UNIQUE ("shop_name");

-- ----------------------------
-- Primary Key structure for table shop
-- ----------------------------
ALTER TABLE "public"."shop" ADD CONSTRAINT "shop_pkey" PRIMARY KEY ("shop_id");

-- ----------------------------
-- Uniques structure for table shop_desc
-- ----------------------------
ALTER TABLE "public"."shop_desc" ADD CONSTRAINT "unq_shop_name" UNIQUE ("shop_name");

-- ----------------------------
-- Primary Key structure for table shop_desc
-- ----------------------------
ALTER TABLE "public"."shop_desc" ADD CONSTRAINT "PK_shop_desc" PRIMARY KEY ("shop_id");

-- ----------------------------
-- Foreign Keys structure for table car_info
-- ----------------------------
ALTER TABLE "public"."car_info" ADD CONSTRAINT "FK.brand,model" FOREIGN KEY ("brand", "model") REFERENCES "public"."car" ("brand", "model") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."car_info" ADD CONSTRAINT "FK.car_id" FOREIGN KEY ("car_id") REFERENCES "public"."car" ("car_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table driver_license
-- ----------------------------
ALTER TABLE "public"."driver_license" ADD CONSTRAINT "FK_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."driver_license" ADD CONSTRAINT "FK_dl_license" FOREIGN KEY ("dl_number") REFERENCES "public"."customer" ("dl_number") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table logs
-- ----------------------------
ALTER TABLE "public"."logs" ADD CONSTRAINT "FK_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Manage
-- ----------------------------
ALTER TABLE "public"."Manage" ADD CONSTRAINT "FK_admin" FOREIGN KEY ("admin_id") REFERENCES "public"."administator" ("admin_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."Manage" ADD CONSTRAINT "FK_shop_id" FOREIGN KEY ("shop_id") REFERENCES "public"."shop" ("shop_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table phone_number
-- ----------------------------
ALTER TABLE "public"."phone_number" ADD CONSTRAINT "FK_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."phone_number" ADD CONSTRAINT "FK_phone_number" FOREIGN KEY ("primary_number") REFERENCES "public"."customer" ("phone_number") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Rental
-- ----------------------------
ALTER TABLE "public"."Rental" ADD CONSTRAINT "FK.card_id" FOREIGN KEY ("car_id") REFERENCES "public"."car" ("car_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."Rental" ADD CONSTRAINT "FK.customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."Rental" ADD CONSTRAINT "FK.returnShop" FOREIGN KEY ("returnShop_id") REFERENCES "public"."shop" ("shop_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."Rental" ADD CONSTRAINT "FK.shop_id" FOREIGN KEY ("pickupShop_id") REFERENCES "public"."shop" ("shop_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table shop
-- ----------------------------
ALTER TABLE "public"."shop" ADD CONSTRAINT "fk_shop_name" FOREIGN KEY ("shop_name") REFERENCES "public"."shop_desc" ("shop_name") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table shop_desc
-- ----------------------------
ALTER TABLE "public"."shop_desc" ADD CONSTRAINT "FK.shop_id" FOREIGN KEY ("shop_id") REFERENCES "public"."shop" ("shop_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."shop_desc" ADD CONSTRAINT "FK.shop_name" FOREIGN KEY ("shop_name") REFERENCES "public"."shop" ("shop_name") ON DELETE NO ACTION ON UPDATE NO ACTION;
