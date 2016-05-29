//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
      
    // You may want to paste your Part 1 implementation of moveComplexRobot() here
        // Step 1.1c
        // Call the function, isFacingWall(), and define a constant to be equal to its return value.
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        // Step 1.1d
        // Test the isFacingWall() function. Be sure to comment out or delete your test code once you are finished testing!
        //if robotIsBlocked {
        //    print("Robot is Blocked, rotate right.")
        //    myRobot.rotateRight()
        //} else {
        //    print("no wall, move ahead.")
        //    myRobot.move()
        //}
        
        // Step 1.4
        // If statement that enables the robot to choose how to move. Use the pseudocode below as a guide.
        
        // Pseudocode
        //         if the robot is blocked {
        //             then randomly rotate
        //         } otherwise {
        //             either continue straight or randomly rotate
        //         }
        //if robotIsBlocked {
        //    randomlyRotateRightOrLeft(myRobot)
        //}
        //else {
        //    continueStraightOrRotate(myRobot)
        //}
        
        // Step 2.1c
        // TODO: Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(myRobot)
        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        // Step 2.2b
        // Test whether the values of the above constants are correct
        if isThreeWayJunction {
            print("Three way Junction")
        }
        if isTwoWayPath {
            print("Two Way Path")
        }
        if isDeadEnd {
            print("Dead End")
        }
        // Step 2.3a
        // Three-way Path - else-if statements
        
        // If the robot encounters a three way junction and there IS a wall ahead, it should randomly rotate right or left.
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        // If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate (you need to write this else-if statement)
        if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot)
        }
        
        // Step 2.3b
        // Two-way Path - else-if statements
        
        // If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        }
        
        // If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
        if isTwoWayPath && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        
        // Step 2.3c
        // Dead end - else-if statements
        
        // If the robot encounters a dead end and there is NO wall ahead it should move forward.
        if isDeadEnd && !robotIsBlocked {
            myRobot.move()
        }
        
        // If the robot encounters a dead end and there IS a wall ahead it should rotateRight().
        if isDeadEnd && robotIsBlocked {
            myRobot.rotateRight()
        }
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}