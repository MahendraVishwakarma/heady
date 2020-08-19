//
//  CategoryListWireFrame.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class CategoryListWireframe {
    static func makeCategoryListViewRootController() -> UIViewController {
        if let vc = StoryboardScenes.kCategoryList.makeViewControllerWithIdentifier(CategoryListViewController.storyBoardId()) {
            return vc
        }
        return UIViewController.init()
    }
}
