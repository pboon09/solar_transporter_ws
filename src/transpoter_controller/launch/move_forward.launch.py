from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, DeclareLaunchArgument
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration, PathJoinSubstitution
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare
import os

def generate_launch_description():
    # Get the path to the RealSense launch file
    realsense_pkg_share = FindPackageShare('realsense2_camera').find('realsense2_camera')
    realsense_launch_file = os.path.join(realsense_pkg_share, 'launch', 'rs_launch.py')
    
    # Get the path to our package
    pkg_share = FindPackageShare('transpoter_controller').find('transpoter_controller')
    
    # Path to the RViz configuration file
    rviz_config_file = os.path.join(pkg_share, 'config', 'view.rviz')
    
    # Launch arguments for the RealSense camera
    unite_imu_method_arg = DeclareLaunchArgument(
        'unite_imu_method',
        default_value='2',
        description='Method to unite IMU data: 0-None, 1-Copy, 2-Linear interpolation'
    )
    
    enable_gyro_arg = DeclareLaunchArgument(
        'enable_gyro',
        default_value='true',
        description='Enable gyroscope'
    )
    
    enable_accel_arg = DeclareLaunchArgument(
        'enable_accel',
        default_value='true',
        description='Enable accelerometer'
    )
    
    # Include the RealSense launch file
    realsense_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(realsense_launch_file),
        launch_arguments={
            'unite_imu_method': LaunchConfiguration('unite_imu_method'),
            'enable_gyro': LaunchConfiguration('enable_gyro'),
            'enable_accel': LaunchConfiguration('enable_accel')
        }.items()
    )
    
    # Launch our custom move forward node
    move_forward_node = Node(
        package='transpoter_controller',
        executable='calculate_dist.py',
        name='realsense_move_forward',
        output='screen'
    )
    
    # Launch RViz with our custom configuration
    rviz_node = Node(
        package='rviz2',
        executable='rviz2',
        name='rviz2',
        arguments=['-d', rviz_config_file],
        output='screen'
    )
    
    # Create and return the launch description
    return LaunchDescription([
        unite_imu_method_arg,
        enable_gyro_arg,
        enable_accel_arg,
        realsense_launch,
        move_forward_node,
        rviz_node
    ])