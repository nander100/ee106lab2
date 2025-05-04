// Auto-generated. Do not edit!

// (in-package ee106s25.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EE106lab_custom {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.int_data = null;
      this.float_data = null;
      this.string_data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('int_data')) {
        this.int_data = initObj.int_data
      }
      else {
        this.int_data = 0;
      }
      if (initObj.hasOwnProperty('float_data')) {
        this.float_data = initObj.float_data
      }
      else {
        this.float_data = 0.0;
      }
      if (initObj.hasOwnProperty('string_data')) {
        this.string_data = initObj.string_data
      }
      else {
        this.string_data = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EE106lab_custom
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [int_data]
    bufferOffset = _serializer.int32(obj.int_data, buffer, bufferOffset);
    // Serialize message field [float_data]
    bufferOffset = _serializer.float32(obj.float_data, buffer, bufferOffset);
    // Serialize message field [string_data]
    bufferOffset = _serializer.string(obj.string_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EE106lab_custom
    let len;
    let data = new EE106lab_custom(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [int_data]
    data.int_data = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [float_data]
    data.float_data = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [string_data]
    data.string_data = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.string_data);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ee106s25/EE106lab_custom';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fb75e96e5657d862c61a6395ce06cb0a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EE106lab_custom(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.int_data !== undefined) {
      resolved.int_data = msg.int_data;
    }
    else {
      resolved.int_data = 0
    }

    if (msg.float_data !== undefined) {
      resolved.float_data = msg.float_data;
    }
    else {
      resolved.float_data = 0.0
    }

    if (msg.string_data !== undefined) {
      resolved.string_data = msg.string_data;
    }
    else {
      resolved.string_data = ''
    }

    return resolved;
    }
};

module.exports = EE106lab_custom;
