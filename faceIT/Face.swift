//
//  Face.swift
//  faceIT
//
//  Created by Michael Ruhl on 21.08.17.
//  Copyright © 2017 NovaTec GmbH. All rights reserved.
//

import Foundation
import ARKit

class Face {
    let name: String
    let node: SCNNode
    var hidden: Bool {
        get{
            return node.opacity != 1
        }
    }
    var timestamp: TimeInterval {
        didSet {
            updated = Date()
        }
    }
    private(set) var updated = Date()
    
    init(name: String, node: SCNNode, timestamp: TimeInterval) {
        self.name = name
        self.node = node
        self.timestamp = timestamp
    }
}

extension Date {
    func isAfter(seconds: Double) -> Bool {
        let elapsed = Date.init().timeIntervalSince(self)
        
        if elapsed > seconds {
            return true
        }
        return false
    }
}
