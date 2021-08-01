//
//  RunLogged.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/5/21.
//
import SwiftUI
import Lottie
//import SwiftUI

struct RunLogged: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "sun.max")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.all, 20)
                    .foregroundColor(Color.orange.opacity(0.8))
                
                Text("Congrats!")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding()
                Text("You Logged in your run for today!")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text("Swipe this down to dismiss")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Image(systemName: "chevron.down")
                    .padding()
            }
        }
        
    }
}






struct RunLogged_Previews: PreviewProvider {
    static var previews: some View {
        RunLogged()
    }
}

