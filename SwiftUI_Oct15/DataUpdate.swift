//
//  DataUpdate.swift
//  SwiftUI_Oct15
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

struct FirstScreen: View {
    @State private var textLabel: String = "EditableText"
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            HStack {
                Text(textLabel)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Button("Edit") {
                    path.append("SecondScreen")
                }
                .padding()
                .background(Color.white)
                .border(Color.blue, width: 3)
                .cornerRadius(5)
            }
            .navigationDestination(for: String.self) { value in
                if value == "SecondScreen" {
                    SecondScreen(textLabel: $textLabel, path: $path)
                }
            }
        }
    }
}

struct SecondScreen: View {
    @Binding var textLabel: String
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            TextField("Editable", text: $textLabel)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .frame(width: 250, height: 50)
            
            Button("Update & Go Back") {
                path.removeLast()
            }
            .padding()
            .background(Color.white)
            .border(Color.blue, width: 3)
            .cornerRadius(5)
        }
        .navigationTitle("Edit Text")
    }
}

#Preview {
    FirstScreen()
}
