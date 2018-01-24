//
//  Rover.swift
//  Rover
//
//  Created by Stephen Walsh on 24/01/2018.
//  Copyright © 2018 Greenby Apps. All rights reserved.
//

import Foundation
import CoreGraphics

class Rover: NSObject {
    
    let startPosition: RoverPosition
    let gridSize: CGSize
    let commands: [RoverCommand]
    
    init?(with representation: Any?) {
        guard let representation = representation as? [String: Any],
            let startPosition = RoverPosition(with: representation["rover_start_point"]),
            let gridSize = Rover.fetchGridSize(from: representation["grid_size"]) else {
            return nil
        }
        
        self.startPosition = startPosition
        self.gridSize = gridSize
        self.commands = RoverCommand.fetchCommands(from: representation["commands"])
        
        super.init()
    }
    
    func executeCommands() -> CGPoint {
        return CGPoint.zero
    }
    
    private class func fetchGridSize(from representation: Any?) -> CGSize? {
        guard let representation = representation as? [String: Any],
            let xString = representation["x"] as? String,
            let yString = representation["y"] as? String else {
                return nil
        }
        
        guard let x = NumberFormatter().number(from: xString)?.doubleValue,
            let y = NumberFormatter().number(from: yString)?.doubleValue else {
                return nil
        }
        
        return CGSize(width: x, height: y)
    }
}
