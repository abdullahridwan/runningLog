//
//  UpdateRun.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/2/21.

//var sliderVal: Double
//var totalMileStr: String
//var totalTimeStr: String
//var caloriesBurnedStr: String
//var commentsStr: String
//var runDate: Date

import SwiftUI

struct UpdateRun: View {
    @ObservedObject var runsOOInput: RunsOO
    @Binding var IDInput: UUID
    
    
    @State private var u_sliderValue: Double = 0
    @State private var u_totalMileString: String = ""
    @State private var u_totalTimeString: String = ""
    @State private var u_caloriesBurnedString: String = ""
    @State private var u_commentsString: String = ""

    //@State var IDInput: UUID
    
    var body: some View {
        let obj = runsOOInput.listOfRuns.first(where: {$0.id == IDInput})
        NavigationView {
            LabelTextFieldWithFormat(label: "Slider Val", placeHolder: obj?.sliderVal ?? 0.0, bindingString: $u_sliderValue)
                
        }
    }
    
    
    
    
}
struct LabelTextFieldWithFormat : View {
    var label: String
    var placeHolder: Double
    var bindingString: Binding<Double>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(String(format: "%2f"), value: bindingString, formatter: NumberFormatter())
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.3), lineWidth: 1))
                //.padding(10)
            }
            .padding(5)
            .padding(.horizontal, 15)
    }
}


struct UpdateRun_Previews: PreviewProvider {
    static var previews: some View {
        let obj = RunsOO()
        UpdateRun(runsOOInput: obj, IDInput: .constant(obj.listOfRuns[0].id))
        //UpdateRun(runsOOInput: obj, IDInput: obj.listOfRuns[0].id)
    }
}
