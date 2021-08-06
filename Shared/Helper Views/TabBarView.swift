//
//  TabBarView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/4/21.
// Main Incoming Page

import SwiftUI

struct TabBarView: View {
    @StateObject var runsOO = RunsOO() // Should be @ObservedObject
    
    
    @ObservedObject var sessionsStore_Input: SessionsStore
    
    //init(){
    //    UITabBar.appearance().barTintColor = .white
    //}
    
    var body: some View {
        TabView {
            
            PastRunsView(runsOO: self.runsOO)
                .tabItem {
                    Label("Logs", systemImage: "list.bullet")
                }
            HomeView(runsOO: self.runsOO)
                .tabItem {
                    Label("Today", systemImage: "pencil")
                }
            SettingsView(sessionsStore_Input: sessionsStore_Input)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(.blue)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(sessionsStore_Input: SessionsStore())
    }
}
