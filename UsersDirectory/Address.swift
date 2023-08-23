//
//  Address.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import Foundation

struct Address: Codable, Hashable {
    let address: String
    let city: String
    let postalCode: String
    let state: String
}
