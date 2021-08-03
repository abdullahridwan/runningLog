//
//  PastRunsView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/6/21.
//

import SwiftUI

struct PastRunsView: View {
    @ObservedObject var runsOO : RunsOO
    @State var updateRunBool: Bool = false
    @State var ID: UUID = UUID()
    //var listOfRuns: [Run]
    
    
    
    var body: some View {
        let listOfRunsSorted = runsOO.listOfRuns.sorted(by: { $0.runDate > $1.runDate })
        NavigationView{
            List{
                ForEach(listOfRunsSorted, id: \.id){runInst in
                    
                    
                    CardView(image: Image(systemName: "sun.max"), imageColor: Color.orange, sliderVal: runInst.sliderVal, totalMileStr: runInst.totalMileStr, totalTimeStr: runInst.totalTimeStr, caloriesBurnedStr: runInst.caloriesBurnedStr, commentsStr: runInst.commentsStr, runDate: runInst.runDate)
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            ID = runInst.id
                            updateRunBool.toggle()
                        })
                    .sheet(isPresented: $updateRunBool, content: {
                        UpdateRun(runsOOInput: self.runsOO, IDInput: $ID)
                    })
                    
                    
                }
            }
            .navigationTitle("Past Workouts")
        }
    }
}

struct PastRunsView_Previews: PreviewProvider {
    static var previews: some View {
        //PastRunsView(listOfRuns: [Run(sliderVal: 3.0, totalMileStr: "2", totalTimeStr: "30:32", caloriesBurnedStr: "650", commentsStr: "Comments String Super Strong Blah Blah", runDate: Date())])
        PastRunsView(runsOO: RunsOO())
    }
}
