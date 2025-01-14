//
//  ProfileView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
