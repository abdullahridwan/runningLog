//
//  CardView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/31/21.
//

import SwiftUI

struct CardView: View {
    var image: Image
    var imageColor: Color
    //var title: String
    //var type: String
    //var price: Double
    
    var sliderVal: Double
    var totalMileStr: String
    var totalTimeStr: String
    var caloriesBurnedStr: String
    var commentsStr: String
    var runDate: Date

    var body: some View {
        //dateFormatter.dateStyle = .short
        let dateString:String = dateToString(dateGiven: runDate)
        

        HStack(alignment: .center) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .padding(.all, 20)
                .padding(.leading, 10)
                .foregroundColor(imageColor)
            
            
            VStack(alignment: .leading) {
                Text(dateString)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Miles: \(totalMileStr)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Text("Time: \(totalTimeStr)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Text("Calories Burned: \(caloriesBurnedStr)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Text("Slider: \(String(format: "%.1f", sliderVal))")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Text("Comments: \(commentsStr)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 0)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .padding(.bottom, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        //.background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .background(
            Color(.white)
        )        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: Image(systemName: "pencil"), imageColor: .pink, sliderVal: 3.0, totalMileStr: "3", totalTimeStr: "30:32", caloriesBurnedStr: "400", commentsStr: "Lorem Ipsum", runDate: Date())
        
    }
}



struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}

