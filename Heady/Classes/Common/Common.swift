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
    case kProductList               = "ProductList"
    
    
}

enum CellIdentifires: String {
    case kCategoryListCell          = "CategoryListCollectionViewCell"
    case kProductListCell           = "ProductListCell"
    case kProductVarient            = "ProductVarientCell"
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
 

// generics type
public enum Result<T, U> where U:Error{
    case success(T)
    case failure(U)
}

// custom error
public enum APIError:Error{
    
    case failedRequest(String?)
}

// hTTPS methods type
public enum HttpsMethod{
    case Post
    case Get
    case Put
    case Delate
    
    var localization:String{
        switch self {
        case .Post: return "POST"
        case .Get: return "GET"
        case .Put: return "PUT"
        case .Delate: return "Delete"
            
        }
        
    }
}

// API url
enum AppURL: String {
    case categoryList = "https://stark-spire-93433.herokuapp.com/json"
}


//Product Colors

enum ChooseColor {
    case SetColor(String)
    
    var associatedColor: UIColor {
        switch self {
        case .SetColor(let value):
            return PickColor.ColorName(name: value)
    }
    
}
}
