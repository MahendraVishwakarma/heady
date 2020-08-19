//
//  ProductVarientCell.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 20/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class ProductVarientCell: UICollectionViewCell {

    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        colorLabel.layer.cornerRadius = colorLabel.frame.height/2
        colorLabel.layer.masksToBounds = true
        colorLabel.layer.borderColor = UIColor.lightGray.cgColor
        colorLabel.layer.borderWidth = 0.5
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    func setData(varient: Variant) {
        colorLabel.backgroundColor =  ChooseColor.SetColor(varient.color.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)).associatedColor
        sizeLabel.text = "Size:\(varient.size ?? 0)"
        priceLabel.text = "₹\(varient.price)"
        
    }
    
   

}
