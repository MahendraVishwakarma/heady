//
//  CategoryDataModel.swift
//  
//
//  Created by Mahendra Vishwakarma on 18/08/20.
//

import Foundation
import RealmSwift

// MARK: - ProcedureDetail Model
struct CategoryDataList: Codable {
    let categories: [Category]
    let rankings: [Ranking]
}

// MARK: - Category Model
struct Category: Codable {
    let id: Int
    let name: String
    let products: [CategoryProduct]
    let childCategories: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id, name, products
        case childCategories = "child_categories"
    }
}

// MARK: - CategoryProducts Model
struct CategoryProduct: Codable {
    let id: Int
    let name, dateAdded: String
    let variants: [Variant]
    let tax: Tax
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case dateAdded = "date_added"
        case variants, tax
    }
}

// MARK: - Tax Model
struct Tax: Codable {
    let name: String
    let value: Double
}


// MARK: - Variant Model
struct Variant: Codable {
    let id: Int
    let color: String
    let size: Int?
    let price: Int
}

// MARK: - Ranking Model
struct Ranking: Codable {
    let ranking: String
    let products: [RankingProduct]
}

// MARK: - RankingProduct Model
struct RankingProduct: Codable {
    let id: Int
    let viewCount, orderCount, shares: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case viewCount = "view_count"
        case orderCount = "order_count"
        case shares
    }
}


class RealmModel : Object {
    
    @objc private dynamic var realmStoredData:Data? = nil
    
    var catObject : CategoryDataList? {
        get {
            if let data = realmStoredData {
                return try? JSONDecoder().decode(CategoryDataList.self, from: data)
            }
            return nil
        }
        set {
            realmStoredData = try? JSONEncoder().encode(newValue)
        }
    }
}
