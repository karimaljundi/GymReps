//
//  WorkoutItemsView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//
import FirebaseFirestore
import SwiftUI

struct WorkoutView: View {
    @StateObject var viewModel = WorkoutViewViewModel()
    @FirestoreQuery var workouts: [WorkoutItem]
    private let userId: String
    init(userId: String){
        self._workouts = FirestoreQuery(collectionPath: "users/\(userId)/workouts")
    }
    var body: some View {
        
        
        NavigationView{
            VStack{
                
            }.navigationTitle("Workout Items")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}

#Preview {
    WorkoutView(userId: ""  )
}
