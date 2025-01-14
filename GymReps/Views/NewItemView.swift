//
//  NewItemView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @State private var showStartDatePicker = false
        @State private var showEndDatePicker = false
        @State private var startDate = Date() // Default to current date
        @State private var endDate = Date()   // Default to current date
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            Form {
                TextField("Title", text: $viewModel.title)
                
                Button(action: {
                                    showStartDatePicker.toggle()
                                }) {
                                    HStack {
                                        Text("Start time: \(startDate.formatted(date: .abbreviated, time: .shortened))")
                                        Spacer()
                                        Image(systemName: "calendar")
                                    }
                                }
                                if showStartDatePicker {
                                    DatePicker(
                                        "",
                                        selection: $startDate,
                                        in: ...endDate, // Ensure start date cannot be after end date
                                        displayedComponents: [.date, .hourAndMinute]
                                    )
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .labelsHidden()
                                }
                Button(action: {
                                    showEndDatePicker.toggle()
                                }) {
                                    HStack {
                                        Text("End time: \(endDate.formatted(date: .abbreviated, time: .shortened))")
                                        Spacer()
                                        Image(systemName: "calendar")
                                    }
                                }
                                if showEndDatePicker {
                                    DatePicker(
                                        "",
                                        selection: $endDate,
                                        in: startDate..., // Ensure end date cannot be before start date
                                        displayedComponents: [.date, .hourAndMinute]
                                    )
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .labelsHidden()
                                }
                    
                
                WorkoutButton(title: "Save", backgroundColor: .blue){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("error"), message: Text("Please fill in all fields"))
            }
        }
    }
    func formattedDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in }))
}
