//
//  APIService.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import Foundation

@MainActor protocol APIServiceProtocol: AnyObject {
    func didReceiveUsers(users: [User])
}

class APIService {
    weak var delegate: APIServiceProtocol?
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: Constants.getUsersURL) else { throw URLError(.badURL) }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let usersDTO = try JSONDecoder().decode(UsersDTO.self, from: data)
            return usersDTO.users
        } catch {
            throw error
        }
    }
    
    func getUsersWithDelegate() async -> Void {
        guard let url = URL(string: Constants.getUsersURL) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let usersDTO = try JSONDecoder().decode(UsersDTO.self, from: data)
            await self.delegate?.didReceiveUsers(users: usersDTO.users)
        } catch {
            return
        }
    }
}
