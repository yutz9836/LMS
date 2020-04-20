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
                
                if self.mode?.wrappedValue == .active{
                    //下面那一段跟網頁上的不一樣，網頁的會錯
                    Button(action:{
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }){Text("cancel")}
                }
                
                
                Spacer()
                EditButton()
            }
            
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
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
