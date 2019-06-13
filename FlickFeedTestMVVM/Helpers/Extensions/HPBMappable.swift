//
//  HPBMappable.swift
//  HelloPaisaBankingApp
//
//  Created by vishnu khaitan on 23/08/18.
//  Copyright © 2018 Diasporatec LTD. All rights reserved.
//

import UIKit

protocol HPBMappable: Decodable {
    init?(jsonString: String)
}
extension HPBMappable {
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        self = try! JSONDecoder().decode(Self.self, from: data)
        // I used force unwrap for simplicity.
        // It is better to deal with exception using do-catch.
    }
}
