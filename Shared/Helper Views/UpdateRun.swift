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
    //@State var IDInput: UUID
    
    var body: some View {
        let obj = runsOOInput.listOfRuns.first(where: {$0.id == IDInput})
        Text("\(obj!.totalMileStr)")
    }
}

struct UpdateRun_Previews: PreviewProvider {
    static var previews: some View {
        let obj = RunsOO()
        UpdateRun(runsOOInput: obj, IDInput: .constant(obj.listOfRuns[0].id))
        //UpdateRun(runsOOInput: obj, IDInput: obj.listOfRuns[0].id)
    }
}
