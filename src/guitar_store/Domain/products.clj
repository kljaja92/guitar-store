(ns guitar-store.Domain.products
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as j]))

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(defn allProducts []
  (j/query mysql-db
  ["select * from products"]))