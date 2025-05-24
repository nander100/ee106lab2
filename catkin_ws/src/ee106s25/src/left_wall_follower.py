#!/usr/bin/env python3
import rospy
import tf
import math
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist, PointStamped


class LeftWallFollowerTF:
   def __init__(self):
       rospy.init_node('left_wall_follower')
       self.cmd_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
       rospy.Subscriber('scan', LaserScan, self.scan_cb)
       self.tf_listener = tf.TransformListener()
      
       # Parameters for wall following
       self.desired_wall_distance = 0.15  # Target distance (middle of 0.1-0.2 range)
       self.min_wall_distance = 0.1
       self.max_wall_distance = 0.2
       self.forward_speed = 0.2
       self.turn_speed = 0.3
       self.front_obstacle_threshold = 0.3
      
       rospy.loginfo("Left Wall Follower Node Initialized")
      
   def scan_cb(self, scan):
       # 1. Process laser scan data
       left_distances = []  # Distances to left wall
       front_distances = []  # Distances in front
      
       for i, r in enumerate(scan.ranges):
           # Skip invalid readings
           if r == float('inf') or r == 0 or r > scan.range_max or math.isnan(r):
               continue
              
           angle = scan.angle_min + i * scan.angle_increment
          
           # Left side readings allow some room tolerance
           if 1.47 <= angle <= 1.67:  # 0.1 radians around 90 degrees
               left_distances.append(r)
          
           # Front readings (for obstacle detection)
           if -0.3 <= angle <= 0.3:  # 17 degrees in front
               front_distances.append(r)
      
       # 2. Check for front obstacles
       front_obstacle = False
       if front_distances:
           min_front_dist = min(front_distances)
           if min_front_dist < self.front_obstacle_threshold:
               front_obstacle = True
               rospy.loginfo_throttle(1, f"Front obstacle detected at {min_front_dist:.2f}m")
      
       # 3. Wall following behavior
       cmd = Twist()
      
       if front_obstacle:
           # Stop and turn right to avoid obstacle
           cmd.linear.x = 0.0
           cmd.angular.z = -self.turn_speed  # Negative for right turn
           rospy.loginfo_throttle(1, "Turning right to avoid front obstacle")
          
       elif left_distances:
           # Get closest wall distance on the left
           min_left_dist = min(left_distances)
           rospy.loginfo_throttle(1, f"Left wall distance: {min_left_dist:.2f}m")
          
           if min_left_dist < self.min_wall_distance:
               # Too close to wall, steer right
               cmd.linear.x = self.forward_speed
               cmd.angular.z = -self.turn_speed * 0.5  # Gentler correction
               rospy.loginfo_throttle(1, "Too close to wall, steering right")
              
           elif min_left_dist > self.max_wall_distance:
               # Too far from wall, steer left
               cmd.linear.x = self.forward_speed * 0.3
               cmd.angular.z = self.turn_speed * 0.75  # Gentler correction
               rospy.loginfo_throttle(1, "Too far from wall, steering left")
              
           else:
               # Within desired range, move forward
               cmd.linear.x = self.forward_speed
               cmd.angular.z = 0.0
               rospy.loginfo_throttle(1, "Within desired range, moving forward")
              
       else:
           # No wall detected on left, turn left to find wall
           cmd.linear.x = self.forward_speed * 0.1  # Slower while searching
           cmd.angular.z = self.turn_speed * 1.3
           rospy.loginfo_throttle(1, "No left wall detected, searching...")
      
       # Publish velocity command
       self.cmd_pub.publish(cmd)
      
   def run(self):
       rospy.spin()
      
if __name__ == '__main__':
   try:
       node = LeftWallFollowerTF()
       node.run()
   except rospy.ROSInterruptException:
       pass
