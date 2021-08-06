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
    @ObservedObject var sessionsStore_Input: SessionsStore
    
    @State var invalidEP = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                LabelTextField(label: "Email", placeHolder: "Input your email", bindingString: $email)
                LabelSecureField(label: "Password", bindingString: $password)
                Text(verbatim: "Password must be 6+ characters")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                
                HStack {
                    Button(action: {
                        if validEmailAndPassword(email: email, password: password) == false {
                            invalidEP = true
                        }else{
                            print("[Login] Signing up...")
                            sessionsStore_Input.signUp(email: email, password: password)
                        }
                    }, label: {
                        Text("Sign Up")
                    })
                    .buttonStyle(GrowingButtonStyle(buttonColor: Color.orange))
                    .alert(isPresented: $invalidEP, content: {
                        Alert(title: Text("Invalid Email or Password"), message: Text("You inputted an invalid email or password. Please check them and try again."), dismissButton: .default(Text("Got it!")))
                    })
                    
                    Button(action: {
                        if validEmailAndPassword(email: email, password: password) == false {
                            invalidEP = true
                        }else{
                            sessionsStore_Input.signIn(email: email, password: password)
                        }
                    }, label: {
                        Text("Login")
                    })
                    .buttonStyle(GrowingButtonStyle(buttonColor: Color.blue))
                    .alert(isPresented: $invalidEP, content: {
                        Alert(title: Text("Invalid Email or Password"), message: Text("You inputted an invalid email or password. Please check them and try again."), dismissButton: .default(Text("Got it!")))
                    })
                }
            }
            .padding(.horizontal, 20)
            .navigationTitle("Login")
        }
    }
    
    
    func validEmailAndPassword(email:String, password:String) -> Bool{
        return (emailValidator(email) && passwordValidator(password))
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
        Login(sessionsStore_Input: SessionsStore())
    }
}
