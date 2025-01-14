//
//  NewItemViewViewModel.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import FirebaseAuth
import FirebaseFirestore

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var startTime = Date()
    @Published var endTime = Date()
    @Published var showAlert = false
    
    init(){
        
    }
    func save(){
        guard canSave else{
            return
        }
        
        // Get current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let newId = UUID().uuidString
        let newWorkout = WorkoutItem(id: newId, title: title, startDate: startTime.timeIntervalSince1970, endDate: endTime.timeIntervalSince1970, isDone: false)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("workouts")
            .document(newId)
            .setData(newWorkout.isDictionary())
        //Create model
        
        //Save model
        
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard startTime < endTime else { return false }
        guard endTime >= Date().addingTimeInterval(-86400) else {return false}
        return true
    }
}
