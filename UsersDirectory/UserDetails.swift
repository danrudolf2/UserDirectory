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
        HStack{
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("email:")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .frame(width: 60)
                    Text(user.email)
                }
                HStack(alignment: .center) {
                    Text("age:")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .frame(width: 60)
                    Text("\(user.age)")
                }
                HStack(alignment: .center) {
                    Text("dob:")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .frame(width: 60)
                    Text(user.birthDate)
                }
            }
            .padding(.top, 30)
            .padding(.leading, 30)
            Spacer()
        }
        HStack(alignment: .top) {
            Text("address:")
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .frame(width: 60)
        
            VStack (alignment: .leading){
                Text(user.address.address)
                Text("\(user.address.city), \(user.address.state) \(user.address.postalCode)")
            }
            Spacer()
        }
        .padding(.top, 30)
        .padding(.leading, 30)
        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
        
        Spacer()

    }
}

#if DEBUG
struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserDetails(user: User.preview)
        }
        
    }
}
#endif
