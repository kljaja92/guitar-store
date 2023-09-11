(ns guitar-store.Domain.addresses
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as j]))

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(defn address []
  (j/query mysql-db ["select * from addresses"]))

(defn getAddress [address_id]
  (first (j/query mysql-db ["select * from addresses where address_id = ?" address_id])))

(defn updateAddress [address_id adr]
  (j/update! mysql-db :addresses adr (j/where {:id address_id})))

(defn removeAddress [address_id]
  (j/execute! mysql-db ["delete from addresses where address_id = ?" address_id]))

(defn insertAddress [adr]
  (j/insert! mysql-db :addresses adr))