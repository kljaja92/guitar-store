(ns guitar-store.db
  (:require [clojure.java.jdbc :as j]))

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(j/query mysql-db
         ["select * from administrators"])

(j/query mysql-db
         ["select * from products"])