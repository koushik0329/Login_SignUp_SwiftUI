//
//  DataUpdateObservable.swift
//  SwiftUI_Oct15
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI
import Combine

class SharedData : ObservableObject {
    @Published var text : String = "Editable"
}

struct FirstScreenII : View {
    
    @ObservedObject var textLabel : SharedData
    
    init(textLabel: SharedData) {
        self.textLabel = textLabel
    }
    
    var body: some View {
        NavigationStack{
            HStack {
                Text(textLabel.text)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                NavigationLink {
                    SecondScreenII(textLabel: textLabel)
                } label: {
                    Text("Edit")
                        .padding()
                        .background(Color.white)
                        .border(Color.blue, width: 3)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct SecondScreenII : View {
    
    @ObservedObject var textLabel : SharedData
    
    init(textLabel: SharedData) {
        self.textLabel = textLabel
    }
    
    var body: some View {
        VStack {
            TextField("Editable", text: $textLabel.text)
                .padding()
                .background(Color.gray)
                .cornerRadius(5)
                .frame(width: 250, height: 100)
            
            Button("Update") {
                
            }
            .padding()
            .background(Color.white)
            .border(Color.blue, width: 3)
            .cornerRadius(5)
        }
    }
}

#Preview {
    FirstScreenII(textLabel: SharedData())
}
