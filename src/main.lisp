(in-package :cl-user)
(defpackage bughunter
  (:use :cl)
  (:import-from :bughunter.config
                :config)
  (:import-from :clack
                :clackup)
  (:export :start
           :stop))
(in-package :bughunter)

(defvar *appfile-path*
  (asdf:system-relative-pathname :bughunter #P"app.lisp"))

(defvar *handler* nil)

(defun start (&rest args &key server port debug &allow-other-keys)
  (declare (ignore server port debug))
  (when *handler*
    (restart-case (error "Server is already running.")
      (restart-server ()
        :report "Restart the server"
        (stop))))
  (setf *handler*
        (apply #'clackup *appfile-path* args)))

(defun stop ()
  (prog1
      (clack:stop *handler*)
    (setf *handler* nil)))
