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
        rospy.loginfo("Left Wall Follower Node Initialized")

    def scan_cb(self, scan):
        pts = []
        for i, r in enumerate(scan.ranges):
            #error handling for invalid range values
            if r == float('inf') or r == 0:
                continue
            angle = scan.angle_min + i * scan.angle_increment
            if 1.52 <= angle <= 1.62:
                x_s = r * math.cos(angle)
                y_s = r * math.sin(angle)
                p = PointStamped()
                p.header.frame_id = scan.header.frame_id
                p.header.stamp = scan.header.stampEX
                p.point.x = x_s
                p.point.y = y_s
                p.point.z = 0
                pts.append(p)
        
        # 2. Transform points to the left_limit frame
        dist = []
        for p in pts:
            try:
                self.tf_listener.waitForTransform('left_limit', p.header.frame_id, p.header.stamp, rospy.Duration(0.1))
                p_out = self.tf_listener.transformPoint('left_limit', p)
                dx = p_out.point.x
                dy = p_out.point.y
                dist.append(math.sqrt(dx**2 + dy**2))
            except (tf.LookupException, tf.ExtrapolationException):
                rospy.logwarn_throttle(5, "Transform error")
                continue
        # 3. Behavior based on the distance to the wall
        #stop if there is obstacle in front
        #ow move forward and adjust heading continuously
        #if the closest wall reading is lass than 0.1 steer right
        #if the closest wall reading is greater than 0.2 steer left
        #if the wall is between 0.1 and 0.2 move forward
        #only use laserscan data no odometry

    def run(self):
        rospy.spin()
    
if __name__ == '__main__':
    try:
        node = LeftWallFollowerTF()
        node.run()
    except rospy.ROSInterruptException:
        pass
        