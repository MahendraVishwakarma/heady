//
//  ProductListViewController.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class ProductListViewController: BaseViewController {

    @IBOutlet weak var headerNAme: UILabel!
    var headerName: String?
    lazy var productList = Array<CategoryProduct>()
    override func viewDidLoad() {
        super.viewDidLoad()

        headerNAme.text = headerName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
