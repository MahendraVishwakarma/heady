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
    var totalList =  Array<CategoryProduct>()
    lazy var rangingProduct = Array<Ranking>()
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var heightContraints: NSLayoutConstraint!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    var selectedRank: [RankingProduct]?
    override func viewDidLoad() {
        super.viewDidLoad()

        headerNAme.text = headerName
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        productTableView.register(UINib(nibName: String(describing: ProductListCell.self), bundle: nil), forCellReuseIdentifier: CellIdentifires.kProductListCell.rawValue)
        productTableView.dataSource = self
        productTableView.tableFooterView = UIView(frame: .zero)
        filterButton.layer.cornerRadius = filterButton.frame.height/2
        filterButton.layer.masksToBounds = true
        pickerView.dataSource = self
        pickerView.delegate  = self
        
        totalList = productList
        
    }
    @IBAction func backView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnFilterTapped(_ sender: Any) {
        dropDown(height: 250)
        
    }
    @IBAction func btnCancel(_ sender: Any) {
        dropDown(height: 0)
    }
    @IBAction func btnDone(_ sender: Any) {
        dropDown(height: 0)
        productList = totalList
        if let rank = selectedRank {
            filterData(rank: rank)
        }
        
    }
    
    private func filterData(rank: [RankingProduct]) {
        
         productList =  productList.filter( { (user: CategoryProduct) -> Bool in
            let subFilteredData = rank.filter({$0.id == user.id})
            
            return subFilteredData.count > 0 ? true : false
        })
        
        productTableView.reloadData()
    }
    
    private func dropDown(height:CGFloat) {
        heightContraints.constant = height
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
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

//MARK:- pickerView delegate & dataSource

extension ProductListViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rangingProduct.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rangingProduct[row].ranking.capitalized
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRank = rangingProduct[row].products
        
    }
    
}

