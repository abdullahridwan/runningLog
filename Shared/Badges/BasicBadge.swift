//
//  BasicBadge.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/2/21.
//

import SwiftUI

struct BasicBadge: View {
    let iconSize: CGFloat
    let colorTopLeft: Color
    let colorBottomRight: Color
    let image: String
    
    var body: some View {
        let halfSize = iconSize/2
        ZStack{
            LinearGradient(
                //Color.red.opacity(0.8)
                //Color.pink.opacity(0.5)
                gradient: Gradient(colors: [colorTopLeft.opacity(0.8),colorBottomRight.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: iconSize, height: iconSize)
                .clipShape(RoundedRectangle(cornerRadius: (iconSize*0.2) ))
            .scaleEffect()
            
            Image(systemName: "\(image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: halfSize, height: halfSize, alignment: .center)
        }
        
        
    }
}

struct BasicBadge_Previews: PreviewProvider {
    static var previews: some View {
        BasicBadge(iconSize: 200, colorTopLeft: Color.red, colorBottomRight: Color.pink, image:"heart.fill")
    }
}
