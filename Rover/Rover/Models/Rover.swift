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
        let endPosition = commands.reduce(startPosition) { (nextResult: RoverPosition, nextCommand: RoverCommand) -> RoverPosition in
            return nextResult.nextPosition(fromCommand: nextCommand)
        }
        return endPosition.location
    }
    
    private class func fetchGridSize(from representation: Any?) -> CGSize? {
        guard let representation = representation as? [String: Any],
            let x = representation["width"] as? Int,
            let y = representation["height"] as? Int else {
                return nil
        }
        return CGSize(width: x, height: y)
    }
}
