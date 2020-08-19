//
//  SpashViewController.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class SpashViewController: BaseViewController {

    var animatingImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animatingImageView = UIImageView.fromGif(frame: .zero, resourceName: "splash")
        if let imageView = animatingImageView {
            view.addSubview(imageView)
            imageView.startAnimating()
        }
        
        
        let _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { [unowned self] timer in
            
            timer.invalidate()
            self.animatingImageView?.stopAnimating()
            self.animatingImageView = nil
            let categoryListViewController = CategoryListWireframe.makeCategoryListViewRootController()
            self.navigationController?.pushViewController(categoryListViewController, animated: true)
        })
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatingImageView?.frame = calculateFrameSize()
        
    }


    func calculateFrameSize() -> CGRect {
        let logiSize = self.view.frame.width*0.8
        let logoFrame = CGRect(x: (view.frame.width - logiSize)/2, y: (view.frame.height - logiSize)/2, width: logiSize, height: logiSize)
        return logoFrame
    }
}
