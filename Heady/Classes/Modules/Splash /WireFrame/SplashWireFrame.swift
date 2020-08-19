//
//  SplashWireFrame.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 18/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class SplashWireframe {
    static func makeSplashView() -> UINavigationController {
        if let nv = StoryboardScenes.kSplashScreen.makeInstantiateViewController() as? UINavigationController {
            return nv
        }
        
        return UINavigationController.init()
    }
}
