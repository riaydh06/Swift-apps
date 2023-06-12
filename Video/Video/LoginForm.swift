//
//  LoginForm.swift
//  Video
//
//  Created by Sayed Riaydh on 6/10/23.
//

import SwiftUI

struct LoginForm: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsLetter = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("BurthDate", selection: $birthdate, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")){
                    Toggle("Send Newsletter", isOn: $shouldSendNewsLetter)
                    Stepper("Number of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "https://seanallen.co")!)
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        hideKeyboard()
                    } label: {
                     Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("Save", action: saveUser)
                }
            }
        }
        .accentColor(.red)
    }
    
    func saveUser(){
        print("User saved")
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}

#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
