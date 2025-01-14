//
//  LoginViewViewModel.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//
import Foundation
import FirebaseAuth


class LoginViewViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    init(){
            
    }
    func login(){
       guard validate() else { return }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in the entire form"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        print("Called")
        return true
    }
    
}
