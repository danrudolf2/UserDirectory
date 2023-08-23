//
//  User.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import Foundation

struct UsersDTO: Codable {
    let users: [User]
    let total: Int
    let limit: Int
}

struct User: Codable, Identifiable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let phone: String
    let username: String
    let birthDate: String
    let image: String
    let eyeColor: String
    let address: Address
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    #if DEBUG
    static let preview = User(id: 5, firstName: "Dan", lastName: "Rudolf", age: 40, gender: "Male", email: "dan@mail.com", phone: "412 760 7595", username: "danrudolf", birthDate: "05/30/1990", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png", eyeColor: "brown", address: Address(address: "123 Street", city: "Austin", postalCode: "78660", state: "TX"))
    #endif
}
