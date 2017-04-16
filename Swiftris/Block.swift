//
//  Block.swift
//  Swiftris
//
//  Created by Jeffrey Kral on 11/14/16.
//  Copyright © 2016 Jeffrey Kral. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(UInt32(NumberOfColors))))!
    }
}

class Block: Hashable, CustomStringConvertible {
    
    
    let color: BlockColor
    
    var column: Int = 0
    var row: Int = 0
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        
        return color.spriteName
    }
    
    var hashValue: Int {
        
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}


func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}

