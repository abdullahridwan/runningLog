//
//  DatePickerCard.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/1/21.
//

import SwiftUI

struct DatePickerCard: View {
    var dateOf: Date
    var dateBinding: Binding<Date>
    var placeholderText: String
    var cardImage: Image
    var foregroundColor: Color
    
    var body: some View {
        HStack(alignment: .center) {
            cardImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                //.padding(.all, 20)
                .padding(.leading, 20)
                .foregroundColor(
                    foregroundColor
                )
            
            VStack(alignment: .leading) {
            }
            .padding(.leading, 5)
            .padding(.top, 20)
            .padding(.bottom, 20)
            .padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(
            Color(.white)
        )        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct DatePickerCard_Previews: PreviewProvider {
    @State var testState: String = "TEst"
    static var previews: some View {
        DatePickerCard_Preview_Container()
    }
}


struct DatePickerCard_Preview_Container: View{
    @State var testState: String = "Test"
    var body: some View{
        CardField(titleOf: "Test TitleOf", titleBinding: $testState, placeholderText: "placeHolder", cardImage: Image(systemName: "heart.fill"), foregroundColor: Color.red.opacity(0.7))
    }
}
