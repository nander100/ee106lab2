#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
class LidarCmdNode:
	def __init__(self):
		rospy.init_node('lidar_cmd_node') 
		self.cmd_pub = rospy.publisher('cmd_vel', Twist, queue_size = 1)
		rospy.Subscriber('scan', LaserScan, self.scan_callback)
		rospy.loginfo("Lidar node initialized")
	def scan_callback(self, scan_msg):
		#this is an example that stops the robot when within 0.5m
		#this code may need to be adjusted for the actual lab
		min_dist = min(r for r in scan_msg.ranges if r>0)
		cmd = Twist()
		if min_dist< 0.5:
			rospy.loginfo("obsticle detected at %.2fm, now stopping", min_dist)
			cmd.linear.x = 0.0
			cmd.angular.z = 0.0
		else:
			cmd.linear.x = 0.1
			cmd.angular.z = 0.0
		self.cmd_pub.publish(cmd)
		
	def run():
		rospy.spin() #keeps nodes alive
		
if __name__ == 'main':
    try:
        node=LidarCmdNode()
        node.run()
    except rospy.ROS.InteruptException:
        pass