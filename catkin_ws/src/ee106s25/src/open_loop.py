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
        # declare the velocity variable
        vel = Twist()

        #set initail velocity
        # move the robot 4m forward
        vel.linear.x = 0.5
        vel.angular.z = 0
        for i in range(80):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.5
        for i in range(35):
            self.vel_pub.publish(vel)
            self.rate.sleep()

        vel.linear.x = 0.5
        vel.angular.z = 0
        for i in range(80):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.5
        for i in range(35):
            self.vel_pub.publish(vel)
            self.rate.sleep()

        vel.linear.x = 0.5
        vel.angular.z = 0
        for i in range(80):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.5
        for i in range(35):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0.5
        vel.angular.z = 0
        for i in range(80):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        vel.linear.x = 0
        vel.angular.z = 0.5
        for i in range(35):
            self.vel_pub.publish(vel)
            self.rate.sleep()
        
        # set the robot values to 0 so it stops rotating
        vel.angular.z = 0.0
        self.vel_pub.publish(vel)


if __name__ == '__main__':
    try:
        tb = Turtlebot()
    except rospy.ROSInterruptException:
        rospy.loginfo("Action terminated.")
