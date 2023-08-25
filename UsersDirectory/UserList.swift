//
//  ContentView.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import SwiftUI

struct UserList<T>: View where T: UserListViewModelProtcol {
    
    @ObservedObject var viewModel: T
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.fetchError != nil {
                Image(systemName: "person.crop.circle.badge.exclamationmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
            } else {
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
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            Task {
                await viewModel.load()
            }
        }
    }
}

#if DEBUG
struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList(viewModel: Mock_UserListViewModel())
            .previewDisplayName("Mock ViewModel")
        UserList(viewModel: UserListViewModel())
            .previewDisplayName("Standard ViewModel")
        UserList(viewModel: UserListViewModelWithProtocol())
            .previewDisplayName("Protocol based viewmodel")
        UserList(viewModel: Mock_UserListViewModelError())
            .previewDisplayName("Error ViewModel")
    }
}
#endif

