
(cl:in-package :asdf)

(defsystem "ee106s25-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "EE106lab_custom" :depends-on ("_package_EE106lab_custom"))
    (:file "_package_EE106lab_custom" :depends-on ("_package"))
    (:file "EE106lab_custom_new" :depends-on ("_package_EE106lab_custom_new"))
    (:file "_package_EE106lab_custom_new" :depends-on ("_package"))
  ))