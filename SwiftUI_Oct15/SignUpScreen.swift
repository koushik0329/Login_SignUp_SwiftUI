//
//  SignUpScreen.swift
//  SwiftUI_Oct15
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

struct SignUpScreen : View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var password: String = ""
    
    @State private var path = NavigationPath()
    
    var body : some View {
        NavigationStack(path: $path) {
            VStack (alignment : .leading, spacing: 10) {
                Text("Create Account")
                    .font(.title)
                
                Text("Sign up to get started")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                
                Text("Name")
                    .font(.headline)
                
                ReusableTextField(title: "Enter First and Last Name", text: $name)
                
                Text("Email Address")
                    .font(.headline)
                
                ReusableTextField(title: "Enter Eamil", text: $email)
                
                Text("Phone")
                    .font(.headline)
                
                ReusableTextField(title: "+91", text: $phone)
                
                Text("Password")
                    .font(.headline)
                
                ReusableTextField(title: "Enter Password", text: $password)
                
                ReusableButton(title: "Create Account") {
                }

            }
            Text("OR")
                .padding(.top, 10)
                    
            Button("Sign In"){
                path.append("LogInScreen")
            }
                .padding(.top, 10)
            .navigationDestination(for: String.self) { value in
                if value == "LogInScreen" {
                    LogInScreen()
                }
            }
        }
    }
}

#Preview {
    SignUpScreen()
}
