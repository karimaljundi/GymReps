//
//  GymRepsApp.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI
import FirebaseCore

@main
struct GymRepsApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
