;; Auto-generated. Do not edit!


(when (boundp 'ee106s25::EE106lab_custom)
  (if (not (find-package "EE106S25"))
    (make-package "EE106S25"))
  (shadow 'EE106lab_custom (find-package "EE106S25")))
(unless (find-package "EE106S25::EE106LAB_CUSTOM")
  (make-package "EE106S25::EE106LAB_CUSTOM"))

(in-package "ROS")
;;//! \htmlinclude EE106lab_custom.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ee106s25::EE106lab_custom
  :super ros::object
  :slots (_header _int_data _float_data _string_data ))

(defmethod ee106s25::EE106lab_custom
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:int_data __int_data) 0)
    ((:float_data __float_data) 0.0)
    ((:string_data __string_data) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _int_data (round __int_data))
   (setq _float_data (float __float_data))
   (setq _string_data (string __string_data))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:int_data
   (&optional __int_data)
   (if __int_data (setq _int_data __int_data)) _int_data)
  (:float_data
   (&optional __float_data)
   (if __float_data (setq _float_data __float_data)) _float_data)
  (:string_data
   (&optional __string_data)
   (if __string_data (setq _string_data __string_data)) _string_data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _int_data
    4
    ;; float32 _float_data
    4
    ;; string _string_data
    4 (length _string_data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _int_data
       (write-long _int_data s)
     ;; float32 _float_data
       (sys::poke _float_data (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _string_data
       (write-long (length _string_data) s) (princ _string_data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _int_data
     (setq _int_data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _float_data
     (setq _float_data (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _string_data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _string_data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ee106s25::EE106lab_custom :md5sum-) "fb75e96e5657d862c61a6395ce06cb0a")
(setf (get ee106s25::EE106lab_custom :datatype-) "ee106s25/EE106lab_custom")
(setf (get ee106s25::EE106lab_custom :definition-)
      "Header header
int32 int_data
float32 float_data
string string_data

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



(provide :ee106s25/EE106lab_custom "fb75e96e5657d862c61a6395ce06cb0a")


