//
//  SettingsView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/5/21.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var sessionsStore_Input: SessionsStore
    
    
    var body: some View {
        let currentEmail = sessionsStore_Input.session?.email ?? ""
        NavigationView{
            Form {
                Section(header: Text("USER")){
                    HStack {
                        Text("User Email")
                        Spacer()
                        Text("\(currentEmail)")
                    }
                }
                
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
                Section {
                    Button(action: {
                        let signOut = self.sessionsStore_Input.signOut()
                        //print("Perform an action here...")
                    }) {
                        Text("Sign Out")
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sessionsStore_Input: SessionsStore())
    }
}
