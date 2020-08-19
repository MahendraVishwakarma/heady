//
//  CategoryListColCollectionViewCell.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class CategoryListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var catTitle: UILabel!
    @IBOutlet weak var cateView: UIView!
    @IBOutlet weak var catName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.init(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 0.3).cgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.cateView.layer.cornerRadius = self.cateView.frame.height/2
        cateView.layer.masksToBounds = true
    }
    
    func setData(category: Category) {
        let categoryName = category.name.trimmingCharacters(in: .whitespacesAndNewlines)
        catName.text = categoryName
        if let firstCaracter = categoryName.first {
            catTitle.text =  String(firstCaracter)
        }
        
    }

}
