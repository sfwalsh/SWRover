//
//  ViewController.swift
//  Rover
//
//  Created by Stephen Walsh on 24/01/2018.
//  Copyright © 2018 Greenby Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dummyDict: [String : Any] = ["grid_size": ["width": 10, "height": 10],
                                     "rover_start_point": ["x": 5, "y": 7, "facing": "N"],
                                     "commands": ["right","advance","left","left","advance","advance","advance","right","advance"]]
    var rover: Rover?
    
    @IBOutlet weak var roverPositionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.rover = Rover(with: dummyDict)
    }
    
    @IBAction func didTapExecuteButton(sender: Any?) {
        if let rover = self.rover {
            let output = rover.executeCommands()
            print("\(output)")
            roverPositionLabel.text = "\(output)"
        }
    }
}

