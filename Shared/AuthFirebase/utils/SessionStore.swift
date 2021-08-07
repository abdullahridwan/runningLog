//
//  SessionStore.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/4/21.
//

import Foundation
import FirebaseAuth




struct User {
    var uid: String
    var email: String
}

class SessionsStore: ObservableObject {
    //@Published var f_listOfRuns: [f_Run]?
    @Published var isAnon: Bool = false
    @Published var session: User?
    
    var handle: AuthStateDidChangeListenerHandle?
    let authRef = Auth.auth()
    
    
    // Checks to see if user is logged in. If so, change Published Fields
    func listen(){
        print("[SessionStore] Listening...")
        handle = authRef.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.isAnon = false
                self.session = User(uid: user.uid, email: user.email!)
                print("[SessionStore] User ceated...")
            } else {
                self.isAnon = true
                self.session = nil
                print("[SessionStore] User not created...")
            }
        })
    }
    
    
    //Sign In User that from email and password textfields
    func signIn(email: String, password: String){
        authRef.signIn(withEmail: email, password: password){ auth, error in
            if error != nil {
                print(error.debugDescription)
            }else{
                print("sign In sucessful!")
            }
        }    }
    
    //Sign Up user created from email and password from textfields
    func signUp(email: String, password: String){
        authRef.createUser(withEmail: email, password: password){ auth, error in
            //print(error ?? "No error; Sign Up Sucessful")
            if error != nil {
            }
        }
        
    }
    
    //Sign out user
    func signOut () -> Bool {
        do {
            try authRef.signOut()
            self.session = nil
            self.isAnon = true
            return true
        } catch {
            return false
        }
    }
    
    
    func unbind() {
        if let handle = handle {
            authRef.removeStateDidChangeListener(handle)
        }
    }
    
}

func emailValidator(_ email: String) -> Bool {
    let name = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    let domain = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    let emailRegEx = name + "@" + domain + "[A-Za-z]{2,8}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailPredicate.evaluate(with: email)
}

func passwordValidator(_ password: String) -> Bool {
    let name = "[A-Z0-9a-z]{6,}"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", name)
    return passwordPredicate.evaluate(with: password)
}
