(ns guitar-store.Domain.customers
  (:refer-clojure :exclude[get])
  (:require [clojure.java.jdbc :as j]))

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(defn customer []
  (j/query mysql-db ["select * from customers"]))

(defn getCustomer [customer_id]
  (first (j/query mysql-db ["select * from customers where customer_id = ?" customer_id])))

(defn updateCustomers [customer_id cust]
  (j/update! mysql-db :customers cust (j/where {:id customer_id})))

(defn removeCustomer [customer_id]
  (j/execute! mysql-db ["delete from customers where customer_id = ?" customer_id]))

(defn insertCustomer [cust]
  (j/execute! mysql-db :customers cust))