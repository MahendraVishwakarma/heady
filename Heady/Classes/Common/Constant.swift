//
//  Constant.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 18/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class PickColor {
   class func ColorName(name: String) -> UIColor {
        switch name {
         case "black":
                   return  UIColor.black
               case "blue":
                    return  UIColor.blue
               case "brown":
                    return  UIColor.brown
               case "golden":
                   return  UIColor.init(red: 201.0/255.0, green: 176.0/255.0, blue: 55.0, alpha: 1)
               case "green":
                    return  UIColor.green
               case "grey":
                    return  UIColor.gray
               case "red":
                    return  UIColor.red
               case "silver":
                    return  UIColor.init(red: 215.0/255.0, green: 215.0/255.0, blue: 215.0, alpha: 1)
               case "white":
                    return  UIColor.white
               case "yellow":
                    return  UIColor.yellow
        default:
             return UIColor.white
        }
    }
}
 
