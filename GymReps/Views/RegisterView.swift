//
//  RegisterView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Count your reps", angle: -15, bgColor: .teal)
            Spacer()
            Form{
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled() 
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                WorkoutButton(title: "Create Account", backgroundColor: .blue){
                    viewModel.register()
            }
            
        }
        .offset(y: -10)
            Spacer()
        }
      
    }
}

#Preview {
    RegisterView()
}
