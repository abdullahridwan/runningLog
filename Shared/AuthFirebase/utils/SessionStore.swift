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

class f_RunOO: ObservableObject {
    @Published var f_listOfRuns: [f_Run]?
    @Published var isAnon: Bool = false
    @Published var session: User?
    
    var handle: AuthStateDidChangeListenerHandle?
    let authRef = Auth.auth()
    
    func listen(){
        handle = authRef.addStateDidChangeListener({ auth, user in
            
            if let user = user {
                self.isAnon = false
                self.session = User(uid: user.uid, email: user.email!)
            } else {
                self.isAnon = true
                self.session = nil
            }
            
            
            
        })
    }
    
}
