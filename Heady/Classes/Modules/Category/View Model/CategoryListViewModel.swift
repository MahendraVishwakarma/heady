//
//  ViewModel.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 19/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryListViewModel: NSObject {
    
    weak var delegate : CategoryListProtocol?
    var categoryList : CategoryDataList?
    let realm = try! Realm()
    
    func fetchData() {
        
        let isDataSaved = realm.objects(RealmModel.self)
        if isDataSaved.count > 0{
            let modelData = isDataSaved
            self.categoryList = modelData.first?.catObject
            self.delegate?.updateDate()
        } else {
            
            let url = AppURL.categoryList.rawValue
            WebServices.requestHttp(urlString: url, method: .Get, param: nil, decode: { (json) -> CategoryDataList? in
                guard let response = json as? CategoryDataList else{
                    return nil
                }
                
                return response
                
            }) { (result) in
                
                switch result {
                case .success(let list) :
                    DispatchQueue.main.async {
                        try! self.realm.write {
                            let myReal = RealmModel()
                            myReal.catObject = list
                            self.realm.add(myReal)
                        }
                    }
                    
                    
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
}
