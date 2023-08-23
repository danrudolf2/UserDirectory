//
//  ContentView.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import SwiftUI

struct UserList: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct UsersList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
