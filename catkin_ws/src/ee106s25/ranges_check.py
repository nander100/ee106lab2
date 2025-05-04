#!/usr/bin/env python3

import roslib
roslib.load_manifest('ee106s25')
import rospy
import math
import tf
from sensor_msgs.msg import LaserScan
from std_msgs.msg import string
import numpy as np

def callback(scan:LaserScan):
	try:
		(trans,rot) = listener.lookupTransform(
		'/base_link', 'front_laser', rospy.Time(0)
		)
	except(tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException): 
		rospy.logwarm("NOTF") 
		return

	T = tf.transfromations.quaternion_matrix(rot)
	T = [0:3,3] = trans
	
	worst='minor'
	for idx,r in enumerate(scan.ranges):
		if not np.isfinite(r):
			continue
		theta = scan.angle_min + idx * scan.angle_increment
		x_l= r * math.cos(theta)
		
	#publish single worst status
	status_msg = string(data = worst)
	pub.publish(status_msg)
	
			
	#publish single major status
	status_msg = string(data = worst)
	pub.publish(status_msg)
	
	if __name == __main__:
		rospy.init_node('tf_litener')
		listener = tf.TransformListener()
		pub = rospy.Publisher('jacal_robot_status', String, queue_size=1)
		rospy.Subscriber('/front_scan', LaserScan, callback)
		Rospy.loginfo("TF with LIDAR")
		rospy.spin()