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
        NavigationView{
            Form {
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
                Section {
                    Button(action: {
                        _ = self.sessionsStore_Input.signOut()
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
