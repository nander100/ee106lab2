#!/usr/bin/env python3

import rospy
import random
from ee106s25.msg import EE106lab_custom_new

def talker():
    rospy.init_node('talker')
    pub = rospy.Publisher('EE106lab_topic', EE106lab_custom_new, queue_size = 10)
    rate = rospy.Rate(10) # 10hz

    while not rospy.is_shutdown():
      msg = EE106lab_custom_new()
      msg.header.stamp = rospy.Time.now()

      msg.int_rand1 = random.randint(1, 100) 
      msg.int_rand2 = random.randint(1, 100)
      pub.publish(msg)

      rate.sleep()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
