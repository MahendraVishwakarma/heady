//
//  ProductListCell.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var varientCollectionView: UICollectionView!
    var varients = Array<Variant>()
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    private func setupUI() {
        varientCollectionView.register(UINib(nibName: String(describing: ProductVarientCell.self), bundle: nil), forCellWithReuseIdentifier: CellIdentifires.kProductVarient.rawValue)
        varientCollectionView.delegate = self
        varientCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(product: CategoryProduct) {
        productName.text = product.name
        varients = product.variants
        reloadData()
    }
    
    func reloadData() {
        
        varientCollectionView.reloadData()
    }

}


extension ProductListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return varients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifires.kProductVarient.rawValue, for: indexPath) as? ProductVarientCell else {
            return UICollectionViewCell()
        }
        
        let varient = varients[indexPath.row]
        cell.setData(varient: varient)
        
        
        return cell
    }
    
    
}

extension ProductListCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: 100, height: 40)
    }
    
}
