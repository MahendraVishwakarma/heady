//
//  CategoryListViewController.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class CategoryListViewController: BaseViewController {
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    var viewModel : CategoryListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        viewModel = CategoryListViewModel()
        viewModel?.delegate = self
        viewModel?.fetchData()
        
        categoryCollection.register(UINib(nibName: String(describing: CategoryListCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: CellIdentifires.kCategoryListCell.rawValue)
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
    }
    
}

// MARK: - collection data source protocol methods
extension CategoryListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.categoryList?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifires.kCategoryListCell.rawValue, for: indexPath) as? CategoryListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let category = viewModel?.categoryList?.categories[indexPath.row] {
            cell.setData(category: category)
        }
        
        return cell
    }
    
    
}

//MARK:- collectionView delegate
extension CategoryListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let productList  = ProductListWireframe.makeProductListViewRootController() as? ProductListViewController ?? nil {
            productList.headerName = viewModel?.categoryList?.categories[indexPath.row].name
            productList.productList = viewModel?.categoryList?.categories[indexPath.row].products ?? []
            productList.rangingProduct = viewModel?.categoryList?.rankings ?? []
            self.navigationController?.pushViewController(productList, animated: true)
        }
        
    }
}

extension CategoryListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.view.frame.width)/2 - 12
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
}


extension CategoryListViewController: CategoryListProtocol {
    func updateDate() {
        DispatchQueue.main.async {
            self.categoryCollection.reloadData()
        }
        
    }
    
    func generateError(error: APIError?) {
        self.showToast(message: error?.localizedDescription ?? "")
    }
}

