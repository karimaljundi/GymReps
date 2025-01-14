//
//  MainViewViewModel.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//
import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject {
    @Published var currentId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
