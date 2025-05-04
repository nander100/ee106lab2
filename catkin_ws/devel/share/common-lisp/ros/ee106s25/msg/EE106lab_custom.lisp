; Auto-generated. Do not edit!


(cl:in-package ee106s25-msg)


;//! \htmlinclude EE106lab_custom.msg.html

(cl:defclass <EE106lab_custom> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (int_data
    :reader int_data
    :initarg :int_data
    :type cl:integer
    :initform 0)
   (float_data
    :reader float_data
    :initarg :float_data
    :type cl:float
    :initform 0.0)
   (string_data
    :reader string_data
    :initarg :string_data
    :type cl:string
    :initform ""))
)

(cl:defclass EE106lab_custom (<EE106lab_custom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EE106lab_custom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EE106lab_custom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ee106s25-msg:<EE106lab_custom> is deprecated: use ee106s25-msg:EE106lab_custom instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EE106lab_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:header-val is deprecated.  Use ee106s25-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'int_data-val :lambda-list '(m))
(cl:defmethod int_data-val ((m <EE106lab_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:int_data-val is deprecated.  Use ee106s25-msg:int_data instead.")
  (int_data m))

(cl:ensure-generic-function 'float_data-val :lambda-list '(m))
(cl:defmethod float_data-val ((m <EE106lab_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:float_data-val is deprecated.  Use ee106s25-msg:float_data instead.")
  (float_data m))

(cl:ensure-generic-function 'string_data-val :lambda-list '(m))
(cl:defmethod string_data-val ((m <EE106lab_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ee106s25-msg:string_data-val is deprecated.  Use ee106s25-msg:string_data instead.")
  (string_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EE106lab_custom>) ostream)
  "Serializes a message object of type '<EE106lab_custom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'int_data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'float_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'string_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'string_data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EE106lab_custom>) istream)
  "Deserializes a message object of type '<EE106lab_custom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'int_data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'float_data) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'string_data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'string_data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EE106lab_custom>)))
  "Returns string type for a message object of type '<EE106lab_custom>"
  "ee106s25/EE106lab_custom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EE106lab_custom)))
  "Returns string type for a message object of type 'EE106lab_custom"
  "ee106s25/EE106lab_custom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EE106lab_custom>)))
  "Returns md5sum for a message object of type '<EE106lab_custom>"
  "fb75e96e5657d862c61a6395ce06cb0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EE106lab_custom)))
  "Returns md5sum for a message object of type 'EE106lab_custom"
  "fb75e96e5657d862c61a6395ce06cb0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EE106lab_custom>)))
  "Returns full string definition for message of type '<EE106lab_custom>"
  (cl:format cl:nil "Header header~%int32 int_data~%float32 float_data~%string string_data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EE106lab_custom)))
  "Returns full string definition for message of type 'EE106lab_custom"
  (cl:format cl:nil "Header header~%int32 int_data~%float32 float_data~%string string_data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EE106lab_custom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4 (cl:length (cl:slot-value msg 'string_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EE106lab_custom>))
  "Converts a ROS message object to a list"
  (cl:list 'EE106lab_custom
    (cl:cons ':header (header msg))
    (cl:cons ':int_data (int_data msg))
    (cl:cons ':float_data (float_data msg))
    (cl:cons ':string_data (string_data msg))
))
