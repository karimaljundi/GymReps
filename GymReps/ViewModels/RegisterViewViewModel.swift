//
//  RegisterViewViewModel.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//
import FirebaseFirestore
import Foundation
import FirebaseAuth
class RegisterViewViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    init(){
        
    }
    func register(){
        guard validate() else { return }
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self.insertUserRecord(id: userId)
        }
    }
    private func insertUserRecord(id: String){
        let user = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id).setData(user.isDictionary())
    }
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
                return false
        }
        guard password.count >= 8 else {
            return false
        }
        return true
    }
}
