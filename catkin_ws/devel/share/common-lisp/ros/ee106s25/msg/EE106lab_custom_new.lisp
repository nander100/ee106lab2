; Auto-generated. Do not edit!


(cl:in-package ee106s25-msg)


;//! \htmlinclude EE106lab_custom_new.msg.html

(cl:defclass <EE106lab_custom_new> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (int_rand1
    :reader int_rand1
    :initarg :int_rand1
    :type cl:integer
    :initform 0)
   (int_rand2
    :reader int_rand2
    :initarg :int_rand2
    :type cl:integer
    :initform 0))
)

(cl:defclass EE106lab_custom_new (<EE106lab_custom_new>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EE106lab_custom_new>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EE106lab_custom_new)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ee106s25-msg:<EE106lab_custom_new> is deprecated: use ee106s25-msg:EE106lab_custom_new instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EE106lab_custom_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:header-val is deprecated.  Use ee106s25-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'int_rand1-val :lambda-list '(m))
(cl:defmethod int_rand1-val ((m <EE106lab_custom_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:int_rand1-val is deprecated.  Use ee106s25-msg:int_rand1 instead.")
  (int_rand1 m))

(cl:ensure-generic-function 'int_rand2-val :lambda-list '(m))
(cl:defmethod int_rand2-val ((m <EE106lab_custom_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:int_rand2-val is deprecated.  Use ee106s25-msg:int_rand2 instead.")
  (int_rand2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EE106lab_custom_new>) ostream)
  "Serializes a message object of type '<EE106lab_custom_new>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'int_rand1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'int_rand2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EE106lab_custom_new>) istream)
  "Deserializes a message object of type '<EE106lab_custom_new>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'int_rand1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'int_rand2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EE106lab_custom_new>)))
  "Returns string type for a message object of type '<EE106lab_custom_new>"
  "ee106s25/EE106lab_custom_new")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EE106lab_custom_new)))
  "Returns string type for a message object of type 'EE106lab_custom_new"
  "ee106s25/EE106lab_custom_new")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EE106lab_custom_new>)))
  "Returns md5sum for a message object of type '<EE106lab_custom_new>"
  "0e647cd8bb535d6620f5f963b21085c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EE106lab_custom_new)))
  "Returns md5sum for a message object of type 'EE106lab_custom_new"
  "0e647cd8bb535d6620f5f963b21085c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EE106lab_custom_new>)))
  "Returns full string definition for message of type '<EE106lab_custom_new>"
  (cl:format cl:nil "Header header~%int32 int_rand1~%int32 int_rand2~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EE106lab_custom_new)))
  "Returns full string definition for message of type 'EE106lab_custom_new"
  (cl:format cl:nil "Header header~%int32 int_rand1~%int32 int_rand2~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EE106lab_custom_new>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EE106lab_custom_new>))
  "Converts a ROS message object to a list"
  (cl:list 'EE106lab_custom_new
    (cl:cons ':header (header msg))
    (cl:cons ':int_rand1 (int_rand1 msg))
    (cl:cons ':int_rand2 (int_rand2 msg))
))
