//
//  Protocols.swift
//  Heady
//
//  Created by Mahendra Vishwakarma on 18/08/20.
//  Copyright © 2020 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

protocol CategoryListProtocol: AnyObject {
    func updateDate()
    func generateError(error: APIError?)
}
