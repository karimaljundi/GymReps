//
//  WorkoutButton.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI

struct WorkoutButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        
        
        Button {
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    WorkoutButton(title: "Value", backgroundColor: .green){
        
    }
}
