//
//  RoverOrientation.swift
//  Rover
//
//  Created by Stephen Walsh on 24/01/2018.
//  Copyright © 2018 Greenby Apps. All rights reserved.
//

import Foundation

enum RoverOrientation: String {
    case north = "N"
    case east = "E"
    case south = "S"
    case west = "W"
    
    init?(with rawValue: String?) {
        guard let orientationString = rawValue,
            let orientation = RoverOrientation(rawValue: orientationString) else {
                return nil
        }
        
        self = orientation
    }
}
