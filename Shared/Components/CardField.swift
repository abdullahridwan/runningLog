//
//  CardField.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/31/21.
//

import SwiftUI

struct CardField: View {
    
    var titleOf: String
    var titleBinding: Binding<String>
    var placeholderText: String
    var cardImage: Image
    var foregroundColor: Color
    
    var body: some View {
        HStack(alignment: .center) {
            cardImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
                .padding(.leading, 15)
                .foregroundColor(
                    foregroundColor
                )
            
            
            VStack(alignment: .leading) {
                LabelTextField(label: titleOf, placeHolder: placeholderText, bindingString: titleBinding)
            }
            .padding(.leading, 5)
            .padding(.top, 12)
            .padding(.bottom, 12)
            .padding(.trailing, 15)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(
            Color(.white)
        )        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct CardField_Previews: PreviewProvider {
    @State var testState: String = "TEst"
    static var previews: some View {
        CardField_Preview_Container()
    }
}

struct CardField_Preview_Container: View{
    @State var testState: String = "Test"
    var body: some View{
        CardField(titleOf: "Test TitleOf", titleBinding: $testState, placeholderText: "placeHolder", cardImage: Image(systemName: "heart.fill"), foregroundColor: Color.red.opacity(0.7))
    }
}

