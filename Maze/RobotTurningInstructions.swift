//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        // Step 1.2
        // If statement that randomly calls either robot.rotateRight() or robot.rotateLeft() (based on the value of the randomNumber constant)
        if randomNumber == 0 {
            robot.rotateRight()
        }
        else {
            robot.rotateLeft()
        }
    }
    
    func continueStraightOrRotate(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        // Step 1.3
        // If statement that randomly calls either robot.move() or randomlyRotateRightOrLeft(robot: ComplexRobotObject)
        if randomNumber == 0 {
            robot.move()
        }
        else {
            randomlyRotateRightOrLeft(robot)
        }
        
    }
    
    func continueStraightOrRotate(robot: ComplexRobotObject, wallInfo:(up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        let randomNumber = arc4random() % 2
        
        // Step 1.3
        // If statement that randomly calls either robot.move() or randomlyRotateRightOrLeft(robot: ComplexRobotObject)
        if randomNumber == 0 {
            robot.move()
        }
        else {
            //randomlyRotateRightOrLeft(robot)
            
            // Step 3.2
            // Instead of calling randomlyRotateRightOrLeft() call turnTowardClearPath() when the robot has randomly chosen to rotate.
            turnTowardClearPath(robot, wallInfo: wallInfo)
        }
        
    }

    func turnTowardClearPath(robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        
        // Step 3.1
        // Tell the robot which way to turn toward the clear path. There are four cases where the robot should rotate to the right. For all other cases, the robot should rotate to the left.
        if robot.direction == .Left && wallInfo.down {
            robot.rotateRight()
        }
        else if robot.direction == .Up && wallInfo.left {
            robot.rotateRight()
        }
        else if robot.direction == .Right && wallInfo.up {
            robot.rotateRight()
        }
        else if robot.direction == .Down && wallInfo.right {
            robot.rotateRight()
        }
        else {
            robot.rotateLeft()
        }
        
        // Test
        //if isFacingWall(robot, direction: robot.direction) {
        //    print("Wrong Turn!")
        //}
        //else {
        //    print("Clear path!")
        //}
    }
    
    func turnTowardClearPathAtThreeWayJunction(robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        // Tell the robot whether to turn toward the clear path or randomly rotate. There are four cases where the robot should continue straight or rotate. For all other cases, the robot should continue straight or turn toward the clear path.
        if robot.direction == .Left && wallInfo.right {
            continueStraightOrRotate(robot)
        }
        else if robot.direction == .Up && wallInfo.down {
            continueStraightOrRotate(robot)
        }
        else if robot.direction == .Right && wallInfo.left {
            continueStraightOrRotate(robot)
        }
        else if robot.direction == .Down && wallInfo.up {
            continueStraightOrRotate(robot)
        }
        else {
            continueStraightOrRotate(robot, wallInfo: wallInfo)
        }
    }

}