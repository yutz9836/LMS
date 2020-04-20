//
//  ProfileHost.swift
//  Landmarks
//
//  Created by cycu on 2020/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//


import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData:UserData
    @State var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton()
            }
            
            if self.mode?.wrappedValue == .inactive{
                ProfileSummary(profile: userData.profile)
            }else {
                Text("profile editor")
            }
            
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
