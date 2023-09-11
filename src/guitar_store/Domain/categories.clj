(ns guitar-store.Domain.categories
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as j]))

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(defn categorie []
  (j/query mysql-db
           ["select * from categories"]))

(defn getCategorie [category_id]
  (first (j/query mysql-db
                  ["select * from categories where category_id = ?" category_id])))

(defn updateCategorie [category_id category]
  (j/update! mysql-db :categories category (j/where {:id category_id})))

(defn removeCategorie [categoty_id]
  (j/execute! mysql-db
  ["delete from categores where category_id = ?" categoty_id]))

(defn insertCategorie [category]
  (j/insert! mysql-db :categories category))




