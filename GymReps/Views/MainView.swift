//
//  ContentView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentId.isEmpty {
            accountView
        }else{
            LoginView()
        }
            }
    @ViewBuilder
    var accountView: some View {
        TabView{
            WorkoutView(userId: viewModel.currentId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    LoginView()
}
