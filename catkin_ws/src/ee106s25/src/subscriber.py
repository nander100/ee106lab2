#!/usr/bin/env python3
from ee106s25.msg import EE106lab_custom_new
import rospy
from std_msgs.msg import String

def callback(data):
    log_msg = (f"Int 1: {data.int_rand1}, "
              f"Int 2: {data.int_rand2}, "
              f"Sum: {data.int_rand1 + data.int_rand2}"
              f"Time Delay: {(rospy.Time.now()-data.header.stamp).to_sec()}s")
    rospy.loginfo(log_msg)

def listener_custom():
    rospy.init_node('listener_custom')
    rospy.Subscriber('EE106lab_topic', EE106lab_custom_new, callback)
    rospy.spin()

if __name__ == '__main__':
    listener_custom()
