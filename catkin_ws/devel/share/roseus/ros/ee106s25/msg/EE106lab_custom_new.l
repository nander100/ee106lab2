;; Auto-generated. Do not edit!


(when (boundp 'ee106s25::EE106lab_custom_new)
  (if (not (find-package "EE106S25"))
    (make-package "EE106S25"))
  (shadow 'EE106lab_custom_new (find-package "EE106S25")))
(unless (find-package "EE106S25::EE106LAB_CUSTOM_NEW")
  (make-package "EE106S25::EE106LAB_CUSTOM_NEW"))

(in-package "ROS")
;;//! \htmlinclude EE106lab_custom_new.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ee106s25::EE106lab_custom_new
  :super ros::object
  :slots (_header _int_rand1 _int_rand2 ))

(defmethod ee106s25::EE106lab_custom_new
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:int_rand1 __int_rand1) 0)
    ((:int_rand2 __int_rand2) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _int_rand1 (round __int_rand1))
   (setq _int_rand2 (round __int_rand2))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:int_rand1
   (&optional __int_rand1)
   (if __int_rand1 (setq _int_rand1 __int_rand1)) _int_rand1)
  (:int_rand2
   (&optional __int_rand2)
   (if __int_rand2 (setq _int_rand2 __int_rand2)) _int_rand2)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _int_rand1
    4
    ;; int32 _int_rand2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _int_rand1
       (write-long _int_rand1 s)
     ;; int32 _int_rand2
       (write-long _int_rand2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _int_rand1
     (setq _int_rand1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _int_rand2
     (setq _int_rand2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ee106s25::EE106lab_custom_new :md5sum-) "0e647cd8bb535d6620f5f963b21085c3")
(setf (get ee106s25::EE106lab_custom_new :datatype-) "ee106s25/EE106lab_custom_new")
(setf (get ee106s25::EE106lab_custom_new :definition-)
      "Header header
int32 int_rand1
int32 int_rand2

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :ee106s25/EE106lab_custom_new "0e647cd8bb535d6620f5f963b21085c3")


