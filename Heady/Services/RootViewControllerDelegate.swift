//
//  RootViewControllerDelegate.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 18/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class RootControllerService : NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let winScene = (scene as? UIWindowScene) else { return }

            self.window = UIWindow(windowScene: winScene)
        
            window?.backgroundColor = UIColor.white
            //window?.tintColor = UIColor.white

            //Appearance setup
            applyNavigationBarStyle()
            applyTabBarStyle()

            //Setup root controller services
            window?.rootViewController = SplashWireframe.makeSplashView()
            window?.makeKeyAndVisible()
        
    }
}

// MARK: Appearance customization
extension RootControllerService {
    
    func applyNavigationBarStyle() {
        
        UITextView.appearance().linkTextAttributes = [ .foregroundColor: UIColor.white]

        let appearance = UINavigationBar.appearance()
       // appearance.tintColor = UIColor.white
        //appearance.barTintColor = UIColor.white
        appearance.isTranslucent = false
    }
    
    func applyTabBarStyle() {
        let appearance = UITabBar.appearance()

        appearance.isTranslucent = false
       // appearance.barTintColor = UIColor.white
        //appearance.tintColor = UIColor.white
    }
    
}
