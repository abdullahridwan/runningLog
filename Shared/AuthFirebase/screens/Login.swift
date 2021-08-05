//
//  Login.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/4/21.
//

import SwiftUI

struct Login: View {
    
    @State var email = ""
    @State var password = ""
    @ObservedObject var f_RunsOO_Input: f_RunsOO
    
    
    var body: some View {
        NavigationView {
            VStack {
                LabelTextField(label: "Email", placeHolder: "Input your email", bindingString: $email)
                LabelSecureField(label: "Password", bindingString: $password)
                
                
                HStack {
                    Button(action: {
                        f_RunsOO_Input.signUp(email: email, password: password)
                    }, label: {
                        Text("Sign Up")
                    })
                    .buttonStyle(GrowingButtonStyle(buttonColor: Color.orange))
                    
                    Button(action: {
                        f_RunsOO_Input.signIn(email: email, password: password)
                    }, label: {
                        Text("Login")
                    })
                    .buttonStyle(GrowingButtonStyle(buttonColor: Color.blue))
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("Login")
        }
    }
}


struct LabelSecureField : View {
    var label: String
    //var placeHolder: String
    var bindingString: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            SecureField("Input your Password", text: bindingString)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.3), lineWidth: 1))
                //.padding(10)
            }
            .padding(5)
            .padding(.horizontal, 15)
    }
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        let f_RunsOO_Input = f_RunsOO()
        Login(f_RunsOO_Input: f_RunsOO_Input)
    }
}
