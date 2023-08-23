//
//  UserListItem.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import SwiftUI

struct UserListRow: View {
    let user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 2))
            
            VStack (alignment: .leading) {
                Text(user.fullName)
                    .font(.headline)
                Text(user.username)
                    .font(.callout)
                Text(user.email)
                    .font(.callout)
            }
            Spacer()
        }
    }
}

struct UserListItem_Previews: PreviewProvider {
    static var previews: some View {
        UserListRow(user: User.preview)
            .previewLayout(.sizeThatFits)
    }
}
