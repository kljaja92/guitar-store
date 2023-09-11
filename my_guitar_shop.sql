-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: my_guitar_shop
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS addresses;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE addresses (
  address_id int NOT NULL AUTO_INCREMENT,
  customer_id int NOT NULL,
  city varchar(40) NOT NULL,
  state varchar(3) DEFAULT NULL,
  zip_code varchar(10) NOT NULL,
  phone varchar(12) NOT NULL,
  PRIMARY KEY (address_id),
  KEY addresses_fk_customers (customer_id),
  CONSTRAINT addresses_fk_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES addresses WRITE;
/*!40000 ALTER TABLE addresses DISABLE KEYS */;
INSERT INTO addresses VALUES (1,1,'Belgrade','SRB','11000','06012345');
/*!40000 ALTER TABLE addresses ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS administrators;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE administrators (
  admin_id int NOT NULL AUTO_INCREMENT,
  email_address varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  PRIMARY KEY (admin_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES administrators WRITE;
/*!40000 ALTER TABLE administrators DISABLE KEYS */;
INSERT INTO administrators VALUES (1,'admin@guitarshop.com','a123','Admin','User'),(2,'admin2@guitarshop.com','a222','Admin2','User2');
/*!40000 ALTER TABLE administrators ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS categories;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE categories (
  category_id int NOT NULL AUTO_INCREMENT,
  category_name varchar(255) NOT NULL,
  PRIMARY KEY (category_id),
  UNIQUE KEY category_name (category_name)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES categories WRITE;
/*!40000 ALTER TABLE categories DISABLE KEYS */;
INSERT INTO categories VALUES (2,'Basses'),(1,'Guitars');
/*!40000 ALTER TABLE categories ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customers (
  customer_id int NOT NULL AUTO_INCREMENT,
  email_address varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  first_name varchar(60) NOT NULL,
  last_name varchar(60) NOT NULL,
  shipping_address_id int DEFAULT NULL,
  billing_address_id int DEFAULT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE KEY email_address (email_address)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES customers WRITE;
/*!40000 ALTER TABLE customers DISABLE KEYS */;
INSERT INTO customers VALUES (1,'milan@gmail.com','123','Milan','Kljajic',123,111),(2,'pavle@gmail.com','345','Pavle','Nikolic',0,222);
/*!40000 ALTER TABLE customers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS order_items;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE order_items (
  item_id int NOT NULL AUTO_INCREMENT,
  order_id int NOT NULL,
  product_id int NOT NULL,
  item_price decimal(10,2) NOT NULL,
  discount_amount decimal(10,2) NOT NULL,
  quantity int NOT NULL,
  PRIMARY KEY (item_id),
  KEY items_fk_orders (order_id),
  KEY items_fk_products (product_id),
  CONSTRAINT items_fk_orders FOREIGN KEY (order_id) REFERENCES orders (order_id),
  CONSTRAINT items_fk_products FOREIGN KEY (product_id) REFERENCES products (product_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES order_items WRITE;
/*!40000 ALTER TABLE order_items DISABLE KEYS */;
INSERT INTO order_items VALUES (1,1,1,71000.00,0.00,1),(2,2,2,135000.00,0.00,2);
/*!40000 ALTER TABLE order_items ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orders (
  order_id int NOT NULL AUTO_INCREMENT,
  customer_id int NOT NULL,
  order_date datetime NOT NULL,
  ship_amount decimal(10,2) NOT NULL,
  tax_amount decimal(10,2) NOT NULL,
  ship_date datetime DEFAULT NULL,
  ship_address_id int NOT NULL,
  card_type varchar(50) NOT NULL,
  card_number char(16) NOT NULL,
  card_expires char(7) NOT NULL,
  billing_address_id int NOT NULL,
  PRIMARY KEY (order_id),
  KEY orders_fk_customers (customer_id),
  CONSTRAINT orders_fk_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES orders WRITE;
/*!40000 ALTER TABLE orders DISABLE KEYS */;
INSERT INTO orders VALUES (1,1,'2023-09-10 10:00:00',1.00,20.00,'2023-09-09 10:00:00',10,'Visa','4111111111111111','09/30',11),(2,2,'2023-09-11 10:00:00',1.00,20.00,'2023-09-10 10:00:00',11,'Master','5111111111111111','09/31',22);
/*!40000 ALTER TABLE orders ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS products;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE products (
  product_id int NOT NULL AUTO_INCREMENT,
  category_id int NOT NULL,
  product_code varchar(10) NOT NULL,
  product_name varchar(255) NOT NULL,
  `description` text NOT NULL,
  list_price decimal(10,2) NOT NULL,
  discount_percent decimal(10,2) NOT NULL DEFAULT '0.00',
  date_added datetime DEFAULT NULL,
  PRIMARY KEY (product_id),
  UNIQUE KEY product_code (product_code),
  KEY products_fk_categories (category_id),
  CONSTRAINT products_fk_categories FOREIGN KEY (category_id) REFERENCES categories (category_id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES products WRITE;
/*!40000 ALTER TABLE products DISABLE KEYS */;
INSERT INTO products VALUES (1,1,'Electric1','G&L Tribute Legacy Black MP Poplar','G&L',71000.00,0.00,'2023-09-07 10:00:00'),(2,1,'Electric2','Mooer GTRS P800 Dark Night','Mooer',135000.00,0.00,'2023-09-07 11:00:00'),(3,2,'Bass1','G&L Tribute Legacy Black MP Poplar','G&L Best Bass',84000.00,0.00,'2023-09-07 12:00:00'),(4,2,'Bass2','PRS SE Kingfisher Bass, Faded Blueburst Wrap','PRS Best Bass',148000.00,0.00,'2023-09-07 13:00:00');
/*!40000 ALTER TABLE products ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11 21:59:36
