//
//  LoginScreen.swift
//  SwiftUI_Oct15
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

struct LogInScreen: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUpScreenPresented = false
    
    var body : some View {
            VStack (alignment : .leading, spacing: 10){
                Text("Login")
                    .font(.title)
                
                Text("Login to get started")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.bottom, 100)
                
                Text("Email Address")
                    .font(.headline)
                
                ReusableTextField(title: "Enter Email", text: $email)
               
                Text("Password")
                    .font(.headline)
                
                ReusableTextField(title: "Enter Password", text: $password)
                
                ReusableButton(title: "Login") {
                }
            }
            
            Button("Create Account"){
                isSignUpScreenPresented = true
            }
            .padding(.top, 20)
            
            .navigationDestination(
                isPresented: $isSignUpScreenPresented,
                destination: { SignUpScreen() }
            )
    }
}

struct ReusableTextField : View {
    let title: String
    @Binding var text: String
    var body: some View {
        TextField(title, text: $text)
            .frame(width: 325, height: 50)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

struct ReusableButton : View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(title)
        }
        .frame(width: 325, height: 50)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding(.top, 20)
    }
}

#Preview {
    LogInScreen()
}
