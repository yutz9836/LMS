//
//  UserData.swift
//  Landmarks
//
//  Created by cycu on 2020/4/6.
//  Copyright © 2020 Apple. All rights reserved.
//


import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
