//
//  RoverPosition.swift
//  Rover
//
//  Created by Stephen Walsh on 24/01/2018.
//  Copyright © 2018 Greenby Apps. All rights reserved.
//

import Foundation
import CoreGraphics

struct RoverPosition {
    
    let location: CGPoint
    let orientation: RoverOrientation
    
    init(location: CGPoint,
         orientation: RoverOrientation) {
        self.location = location
        self.orientation = orientation
    }
    
    init?(with representation: Any?) {
        guard let representation = representation as? [String: Any] else {
            return nil
        }
        
        guard let location = RoverPosition.fetchLocation(from: representation),
            let orientation = RoverOrientation.init(with: representation["facing"] as? String) else {
            return nil
        }
        
        self.location = location
        self.orientation = orientation
    }
    
    func nextPosition(fromCommand command: RoverCommand) -> RoverPosition {
        let nextLocation = CGPoint(x: orientation.newX(fromCommand: command, forX: Int(self.location.x)),
                                   y: orientation.newY(fromCommand: command, forY: Int(self.location.y)))
        let nextOrientation = orientation.newOrientation(fromCommand: command)
        return RoverPosition(location: nextLocation, orientation: nextOrientation)
    }
    
    private static func fetchLocation(from representation: [String: Any]) -> CGPoint? {
        guard let x = representation["x"] as? Int,
            let y = representation["y"] as? Int else {
            return nil
        }
    
        return CGPoint(x: x, y: y)
    }
}
