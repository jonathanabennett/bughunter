(in-package :cl-user)
(defpackage bughunter-test
  (:use :cl
        :bughunter
        :prove))
(in-package :bughunter-test)

(plan nil)

;; blah blah blah.

(finalize)
