//
//  SessionStore.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/4/21.
//

import Foundation
import FirebaseAuth


struct f_Run {
    var f_id = UUID()
    var f_sliderVal: Double
    var f_totalMileStr: String
    var f_totalTimeStr: String
    var f_caloriesBurnedStr: String
    var f_commentsStr: String
    var f_runDate: Date
}

struct User {
    var uid: String
    var email: String
}

class f_RunsOO: ObservableObject {
    @Published var f_listOfRuns: [f_Run]?
    @Published var isAnon: Bool = false
    @Published var session: User?
    
    var handle: AuthStateDidChangeListenerHandle?
    let authRef = Auth.auth()
    
    
    // Checks to see if user is logged in. If so, change Published Fields
    func listen(){
        handle = authRef.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.isAnon = false
                self.session = User(uid: user.uid, email: user.email!)
            } else {
                self.isAnon = true
                self.session = nil
            }
        })
    }
    
    
    //Sign In User that from email and password textfields
    func signIn(email: String, password: String){
        authRef.signIn(withEmail: email, password: password)
    }
    
    //Sign Up user created from email and password from textfields
    func signUp(email: String, password: String){
        authRef.createUser(withEmail: email, password: password)
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
