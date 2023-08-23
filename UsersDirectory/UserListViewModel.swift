//
//  UserListViewModel.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import Foundation

@MainActor final class UserListViewModel: ObservableObject {
    
    @Published private(set) var users = [User]()
    @Published private(set) var fetchError: Error?
    
    private let apiService = APIService()
    
    func load() async {
        fetchError = nil
        do {
            users = try await apiService.getUsers()
        } catch {
            fetchError = error
        }
    }
    
}
