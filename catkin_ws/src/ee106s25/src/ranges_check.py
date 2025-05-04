#!/usr/bin/env python3
import roslib
roslib.load_manifest('ee106s25')
import rospy
import math
import tf
from sensor_msgs.msg import LaserScan
from std_msgs.msg import String
import numpy as np

def callback(scan):
    try:
        # Get transform between front_laser and front_bumper
        (trans, rot) = listener.lookupTransform('/front_bumper', '/front_laser', rospy.Time(0))
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
        rospy.logwarn("No transform found between front_laser and front_bumper")
        return
    
    # Create transformation matrix
    T = tf.transformations.quaternion_matrix(rot)
    T[0:3, 3] = trans
    
    worst = 'minor'  # Default classification
    
    # Process each laser scan point
    for idx, r in enumerate(scan.ranges):
        # Skip infinite or invalid ranges
        if not np.isfinite(r):
            continue
        
        # Calculate angle for this laser reading
        theta = scan.angle_min + idx * scan.angle_increment
        
        # Convert polar to cartesian coordinates in laser frame
        x_l = r * math.cos(theta)
        y_l = r * math.sin(theta)
        z_l = 0.0
        
        # Create point in homogeneous coordinates
        point_laser = np.array([x_l, y_l, z_l, 1.0])
        
        # Transform point to front_bumper frame
        point_bumper = np.dot(T, point_laser)
        
        # Get distance (only consider x-coordinate for forward distance)
        distance = point_bumper[0]
        
        # Classify based on distance
        if distance < 0.2:
            classification = 'critical'
        elif distance < 0.5:
            classification = 'major'
        else:
            classification = 'minor'
        
        # Update worst case
        if classification == 'critical':
            worst = 'critical'
            break  # Critical is the worst, so we can stop checking
        elif classification == 'major' and worst != 'critical':
            worst = 'major'
    
    # Publish status message with worst classification
    status_msg = String(data=worst)
    pub.publish(status_msg)
    rospy.loginfo(f"Published status: {worst}")

if __name__ == '__main__':
    rospy.init_node('ranges_check')
    listener = tf.TransformListener()
    
    # Allow time for TF to initialize
    rospy.sleep(1.0)
    
    # Create publisher for status messages
    pub = rospy.Publisher('/jackal_robot_status', String, queue_size=1)
    
    # Subscribe to laser scan topic
    rospy.Subscriber('/front/scan', LaserScan, callback)
    
    rospy.loginfo("Ranges check node initialized. Monitoring laser scans...")
    rospy.spin()