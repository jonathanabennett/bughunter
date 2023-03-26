(defsystem "bughunter-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Jonathan A. Bennett"
  :license ""
  :depends-on ("bughunter"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "bughunter"))))
  :description "Test system for bughunter"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
