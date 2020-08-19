//
//  ProductListWireFrame.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class ProductListWireframe {
    static func makeProductListViewRootController() -> UIViewController {
        if let vc = StoryboardScenes.kProductList.makeViewControllerWithIdentifier(ProductListViewController.storyBoardId()) {
            return vc
        }
        return UIViewController.init()
    }
}
