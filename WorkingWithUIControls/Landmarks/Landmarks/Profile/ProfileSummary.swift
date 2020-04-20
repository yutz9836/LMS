//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by cycu on 2020/4/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
        
            VStack(alignment: .leading){
                Text("Complete Badges")
                    .font(.headline)
                ScrollView(.horizontal) {
                    HStack{
                        HikeBadge(name:"first Hike")
                        HikeBadge(name:"Earth day")
                            .hueRotation(Angle(degrees: -130))
                        HikeBadge(name:"first Badge")
                            .hueRotation(Angle(degrees: 296))
                            .grayscale(0.1)
                        HikeBadge(name:"Earth day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name:"Earth day")
                            .hueRotation(Angle(degrees: -230))
                        //Shift+CMD+L
                        
                    }
                    .frame(height:140)
                }
            }
            
            VStack(alignment: .leading){
                Text("Recent Hikes")
                HikeView(hike: hikeData[0])
            }
            
        }
        
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
