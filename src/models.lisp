(in-package :cl-user)
(defpackage bughunter.models
  (:use :cl
        :sxql
        :bughunter.db
        :bughunter.config
        :mito
        :split-sequence)
  (:import-from :bughunter.config
                :config)
  (:export :make-codeblock
           :find-codeblock
           :connect))

(in-package :bughunter.models)

(mito:deftable codeblock ()
  ((language :col-type (:varchar 30))
   (codeblock :col-type (:text))))

(defun make-codeblock (&key language codeblock)
  (with-connection (db)
    (mito:create-dao 'codeblock :language language :codeblock :codeblock)))

(defun find-team (&key :id)
  (with-connection (db)
    (mito:find-dao 'codeblock :id id)))


(defun ensure-tables ()
  (mapcar #'mito:ensure-table-exists '(codeblock)))

(with-connection (db)
  (ensure-tables))
