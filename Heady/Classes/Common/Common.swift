//
//  Common.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 18/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

import UIKit

enum StoryboardScenes: String {
    case kSplashScreen              = "Splash"
    case kCategoryList              = "CategoryList"
    case kProductList               = "productList"
    
}

extension StoryboardScenes {
    func makeInstantiateViewController() -> UIViewController? {
        return storyboardWithName(self.rawValue).instantiateInitialViewController()
    }
    
    func makeViewControllerWithIdentifier(_ identifier: String) -> UIViewController? {
        return storyboardWithName(self.rawValue).instantiateViewController(withIdentifier: identifier)
    }
    
    func storyboardWithName(_ name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}
 

