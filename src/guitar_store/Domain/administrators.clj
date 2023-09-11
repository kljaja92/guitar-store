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

(defn updateAdministrators [admin_id administrators]
  (j/update! mysql-db :administrators administrators (j/where {:admin_id admin_id})))

(defn insertAdministrator [admin]
  (j/insert! mysql-db :administrators admin))

(defn removeAdministrator [admin_id]
  (j/execute! mysql-db ["delete from administrators where admin_id = ?" admin_id]))