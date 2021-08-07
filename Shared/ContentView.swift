//
//  ContentView.swift
//  Shared
//
//  Created by Abdullah Ridwan on 7/4/21.
//

import SwiftUI

struct ContentView: View {
    
    //The test/hardlist observed object was in TabBarView(). For sake of simplicity, the firebase one will be here. After testing, delete all hardList mentions for testflight
    
    // Parent Observed Object
    @ObservedObject var sessionsStore = SessionsStore()
    @ObservedObject var firebaseRunsVM = FirebaseRunsViewModel()
    
    init() {
        sessionsStore.listen()
        firebaseRunsVM.fetchData()
    }
    
    var body: some View {
        TabBarView(sessionsStore_Input: sessionsStore, firebaseRunsVM_Input: firebaseRunsVM)
            .fullScreenCover(isPresented: $sessionsStore.isAnon, content: {
                Login(sessionsStore_Input: sessionsStore)
            })
        //Testing running list
//        RunList()
//            .fullScreenCover(isPresented: $sessionsStore.isAnon, content: {
//                            Login(sessionsStore_Input: sessionsStore)
//                        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//All Modifiers used throughout the Code


/// Custom Button style used for all Buttons. 
struct GrowingButtonStyle: ButtonStyle {
    let buttonColor: Color // ex: Color.orange
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(buttonColor.opacity(0.75))
            .cornerRadius(8.0)
            .padding(.top, 10)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
