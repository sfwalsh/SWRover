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
    
    private static func fetchLocation(from representation: [String: Any]) -> CGPoint? {
        guard let xString = representation["x"] as? String,
            let yString = representation["y"] as? String else {
            return nil
        }
        
        guard let x = NumberFormatter().number(from: xString)?.doubleValue,
            let y = NumberFormatter().number(from: yString)?.doubleValue else {
                return nil
        }
        
        return CGPoint(x: x, y: y)
    }
}
