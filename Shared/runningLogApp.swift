//
//  runningLogApp.swift
//  Shared
//
//  Created by Abdullah Ridwan on 7/4/21.
//

import SwiftUI
import Firebase

@main
struct runningLogApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
