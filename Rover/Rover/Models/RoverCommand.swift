//
//  RoverCommand.swift
//  Rover
//
//  Created by Stephen Walsh on 24/01/2018.
//  Copyright © 2018 Greenby Apps. All rights reserved.
//

import Foundation

enum RoverCommand: String {
    case advance = "advance"
    case left = "left"
    case right = "right"
    
    static func fetchCommands(from representation: Any?) -> [RoverCommand] {
        guard let representation = representation as? [String] else {
            return []
        }
        
        return representation.flatMap({RoverCommand(rawValue: $0)})
    }
}
