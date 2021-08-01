//
//  TabBarView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/4/21.
// Main Incoming Page

import SwiftUI

struct TabBarView: View {
    init(){
        UITabBar.appearance().barTintColor = .white
    }
    var body: some View {
        TabView {
            
            PastRunsView(listOfRuns: testRunList)
                .tabItem {
                    Label("Logs", systemImage: "list.bullet")
                }
            HomeView()
                .tabItem {
                    Label("Today", systemImage: "pencil")
                }
//            Text("Jill")
//                .tabItem {
//                    Label("Order", systemImage: "square.and.pencil")
//                }
        }
        .accentColor(.red)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
