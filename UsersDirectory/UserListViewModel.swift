//
//  UserListViewModel.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import Foundation

@MainActor protocol UserListViewModelProtcol: ObservableObject {
    var users: [User] { get set }
    var fetchError: Error? { get set }
    var isLoading: Bool { get set }
    
    func load() async
}


class UserListViewModel: UserListViewModelProtcol {
    
    
    @Published var users = [User]()
    @Published var fetchError: Error?
    @Published var isLoading: Bool = false

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

class UserListViewModelWithProtocol: UserListViewModelProtcol, APIServiceProtocol {
    
    @Published var users = [User]()
    @Published var fetchError: Error? = nil
    @Published var isLoading: Bool = false

    private let apiService = APIService()
    
    init() {
        apiService.delegate = self
    }
    
    func didReceiveUsers(users: [User]) {
        self.isLoading = false
        self.users = users
    }
    
    func load() async {
        self.isLoading = true
        await apiService.getUsersWithDelegate()
    }
    
}


#if DEBUG
class Mock_UserListViewModel: UserListViewModelProtcol {
    
    @Published var users = [User]()
    @Published var fetchError: Error?
    @Published var isLoading: Bool = false
    
    private let apiService = APIService()
    
    func load() async {
        users = [User.preview]
    }
    
}

class Mock_UserListViewModelError: UserListViewModelProtcol {
    
    @Published var users = [User]()
    @Published var fetchError: Error?
    @Published var isLoading: Bool = false
    
    private let apiService = APIService()
    
    func load() async {
        fetchError = URLError(.badURL)
    }
}

class Mock_UserListViewModelLoading: UserListViewModelProtcol {
    
    @Published var users = [User]()
    @Published var fetchError: Error?
    @Published var isLoading: Bool = false
    
    private let apiService = APIService()
    
    func load() async {
        isLoading = true
    }
}
#endif

