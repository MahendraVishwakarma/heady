//
//  ViewModel.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation


class CategoryListViewModel: NSObject {
    
    weak var delegate : CategoryListProtocol?
    var categoryList : CategoryDataList?
    func fetchData() {
        
        let url = AppURL.categoryList.rawValue
        WebServices.requestHttp(urlString: url, method: .Get, param: nil, decode: { (json) -> CategoryDataList? in
            guard let response = json as? CategoryDataList else{
                return nil
            }
            
            return response
            
        }) { (result) in
            
            switch result {
            case .success(let list) :
                self.categoryList = list
                self.delegate?.updateDate()
                break
            case .failure(let error) :
                self.delegate?.generateError(error: error)
                break
            }
        }
        
    }
}
