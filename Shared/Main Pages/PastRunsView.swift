//
//  PastRunsView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/6/21.
//

import SwiftUI

struct PastRunsView: View {
    var listOfRuns: [Run]
    var body: some View {
        NavigationView{
            List{
                ForEach(listOfRuns, id: \.id){runInst in
                    CardView(image: Image(systemName: "sun.max"), imageColor: Color.orange, sliderVal: runInst.sliderVal, totalMileStr: runInst.totalMileStr, totalTimeStr: runInst.totalTimeStr, caloriesBurnedStr: runInst.caloriesBurnedStr, commentsStr: runInst.commentsStr, runDate: runInst.runDate)
                }
            }
            .navigationTitle("Past Workouts")
        }
    }
}

struct PastRunsView_Previews: PreviewProvider {
    static var previews: some View {
        //PastRunsView(listOfRuns: [Run(sliderVal: 3.0, totalMileStr: "2", totalTimeStr: "30:32", caloriesBurnedStr: "650", commentsStr: "Comments String Super Strong Blah Blah", runDate: Date())])
        PastRunsView(listOfRuns: testRunList)
    }
}
