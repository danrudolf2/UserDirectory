//
//  UserDetails.swift
//  UsersDirectory
//
//  Created by Dan on 8/22/23.
//

import SwiftUI

struct UserDetails: View {
    var user: User
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
        }
        .padding(.top, 30)
        VStack {
            Text(user.email)
            Text("\(user.age)")
            Text(user.birthDate)
        }
        .padding(.top, 30)
        VStack {
            Text(user.address.address)
            Text("\(user.address.city), \(user.address.state) \(user.address.postalCode)")
        }
        .padding(.top, 30)
        Spacer()

        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserDetails(user: User.preview)
        }
        
    }
}
