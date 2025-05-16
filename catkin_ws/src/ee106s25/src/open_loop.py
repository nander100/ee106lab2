#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from math import pi

class Turtlebot():
    def __init__(self):
        rospy.init_node("turtlebot_move")
        rospy.loginfo("Press Ctrl + C to terminate")
        self.vel_pub = rospy.Publisher("cmd_vel", Twist, queue_size=10)
        self.rate = rospy.Rate(10)
        self.run()

    def run(self):
        a_it = 157
        l_it = 207
        # declare the velocity variable
        vel = Twist()

        #set initail velocity
        # move the robot 4m forward
        vel.linear.x = 0.2
        vel.angular.z = 0
        for i in range(l_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.1
        for i in range(a_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()

        vel.linear.x = 0.2
        vel.angular.z = 0
        for i in range(l_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.1
        for i in range(a_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()

        vel.linear.x = 0.2
        vel.angular.z = 0
        for i in range(l_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.1
        for i in range(a_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0.2
        vel.angular.z = 0
        for i in range(l_it):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        # set the robot values to 0 so it stops moving
        vel.linear.x = 0.0
        self.vel_pub.publish(vel)


if __name__ == '__main__':
    try:
        tb = Turtlebot()
    except rospy.ROSInterruptException:
        rospy.loginfo("Action terminated.")
