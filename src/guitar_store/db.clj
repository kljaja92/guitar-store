(ns guitar-store.db)

(def mysql-db {:host "localhost"
               :dbtype "mysql"
               :dbname "my_guitar_shop"
               :user "root"
               :password "password"})

(j/query mysql-db
         ["select * from administrators"]
         {:row-fn :cost})