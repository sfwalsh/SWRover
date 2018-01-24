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
    
    func newX(fromCommand command: RoverCommand,
              forX x: Int) -> Int {
        switch command {
        case .advance:
            switch self {
            case .north, .south:
                return x
            case .east:
                return x+1
            case .west:
                return x-1
            }
        case .left:
            switch self {
            case .north:
                return x-1
            case .south:
                return x+1
            case .east, .west:
                return x
            }
        case .right:
            switch self {
            case .north:
                return x+1
            case .south:
                return x-1
            case .east, .west:
                return x
            }
        }
    }
    
    func newY(fromCommand command: RoverCommand,
              forY y: Int) -> Int {
        switch command {
        case .advance:
            switch self {
            case .north:
                return y-1
            case .south:
                return y+1
            case .east, .west:
                return y
            }
        case .left:
            switch self {
            case .north, .south:
                return y
            case .east:
                return y-1
            case .west:
                return y+1
            }
        case .right:
            switch self {
            case .north, .south:
                return y
            case .east:
                return y+1
            case .west:
                return y-1
            }
        }
    }
    
    func newOrientation(fromCommand command: RoverCommand) -> RoverOrientation {
        switch command {
        case .advance:
            return self
        case .left:
            switch self {
            case .north:
                return .west
            case .south:
                return .east
            case .east:
                return .north
            case .west:
                return .south
            }
        case .right:
            switch self {
            case .north:
                return .east
            case .south:
                return .west
            case .east:
                return .south
            case .west:
                return .north
            }
        }
    }
}
