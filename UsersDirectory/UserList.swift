//
//  ContentView.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import SwiftUI

struct UserList: View {
    
    @StateObject var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                NavigationLink(value: user) {
                    UserListRow(user: user)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Users")
            .navigationDestination(for: User.self){ user in
                UserDetails(user: user)
            }
            .task {
                await viewModel.load()
            }
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
