(ns guitar-store.Domain.administrators
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as j]))

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(defn administrator []
  (j/query mysql-db
           ["select * from administrators a"]))

(defn get [admin_id]
  (first (j/query mysql-db
                  ["select * from administrators where admin_id = ?" admin_id])))