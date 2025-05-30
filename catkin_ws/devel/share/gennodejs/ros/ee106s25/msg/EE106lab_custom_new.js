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

class EE106lab_custom_new {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.int_rand1 = null;
      this.int_rand2 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('int_rand1')) {
        this.int_rand1 = initObj.int_rand1
      }
      else {
        this.int_rand1 = 0;
      }
      if (initObj.hasOwnProperty('int_rand2')) {
        this.int_rand2 = initObj.int_rand2
      }
      else {
        this.int_rand2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EE106lab_custom_new
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [int_rand1]
    bufferOffset = _serializer.int32(obj.int_rand1, buffer, bufferOffset);
    // Serialize message field [int_rand2]
    bufferOffset = _serializer.int32(obj.int_rand2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EE106lab_custom_new
    let len;
    let data = new EE106lab_custom_new(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [int_rand1]
    data.int_rand1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [int_rand2]
    data.int_rand2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ee106s25/EE106lab_custom_new';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0e647cd8bb535d6620f5f963b21085c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EE106lab_custom_new(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.int_rand1 !== undefined) {
      resolved.int_rand1 = msg.int_rand1;
    }
    else {
      resolved.int_rand1 = 0
    }

    if (msg.int_rand2 !== undefined) {
      resolved.int_rand2 = msg.int_rand2;
    }
    else {
      resolved.int_rand2 = 0
    }

    return resolved;
    }
};

module.exports = EE106lab_custom_new;
