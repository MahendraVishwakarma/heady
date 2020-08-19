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
    @IBOutlet weak var productTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        headerNAme.text = headerName
        setupUI()
        
    }
    
    private func setupUI() {
        
        productTableView.register(UINib(nibName: String(describing: ProductListCell.self), bundle: nil), forCellReuseIdentifier: CellIdentifires.kProductListCell.rawValue)
        productTableView.dataSource = self
        productTableView.tableFooterView = UIView(frame: .zero)
    }
    @IBAction func backView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- tableView Data source
extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifires.kProductListCell.rawValue, for: indexPath) as? ProductListCell else {
            return UITableViewCell()
        }
        
        let product = productList[indexPath.row]
        cell.setData(product: product)
        
        return cell
    }
    
   
    
}
