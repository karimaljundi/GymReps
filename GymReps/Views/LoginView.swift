//
//  LoginView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI
struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                HeaderView(title: "Rep Counter", subtitle: "Count your reps", angle: 15, bgColor: .indigo)
               
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    WorkoutButton(title: "Log in", backgroundColor: .blue){
                        viewModel.login()
                    }
                        
                    
                }
                VStack{
                    Text("No Account?")
                    NavigationLink("Create account instead", destination: RegisterView())
                        
                    
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
