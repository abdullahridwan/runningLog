//
//  PastRunsView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/6/21.
//

import SwiftUI

struct PastRunsView: View {
    //@ObservedObject var runsOO : RunsOO
    
    @ObservedObject var firebaseRunsVM: FirebaseRunsViewModel
    
    @State var updateRunBool: Bool = false
    @State var ID: String = UUID().uuidString
    //var listOfRuns: [Run]
    
    
    
    var body: some View {
        let listOfRunsSorted = firebaseRunsVM.firebaseRuns.sorted(by: { $0.f_runDate > $1.f_runDate })
        NavigationView{
            List{
                ForEach(listOfRunsSorted, id: \.id){runInst in
                    CardView(image: Image(systemName: "sun.max"), imageColor: Color.orange, sliderVal: runInst.f_sliderVal, totalMileStr: runInst.f_totalMileStr, totalTimeStr: runInst.f_totalTimeStr, caloriesBurnedStr: runInst.f_caloriesBurnedStr, commentsStr: runInst.f_commentsStr, runDate: runInst.f_runDate)
                        .onTapGesture(count: 1, perform: {
                            ID = runInst.id ?? ""
                            updateRunBool.toggle()
                        })
                    .sheet(isPresented: $updateRunBool, content: {
                        
                        //get the tapped object
                        //print(ID)
                        let obj = self.firebaseRunsVM.firebaseRuns.first(where: {$0.id == ID})
                        UpdateRun(firebaseRunsVM: firebaseRunsVM, docIDInput: ID, u_sliderValue: obj?.f_sliderVal ?? 0.0, u_totalMileString: obj?.f_totalMileStr ?? "", u_totalTimeString: obj?.f_totalTimeStr ?? "", u_caloriesBurnedString: obj?.f_caloriesBurnedStr ?? "", u_commentsString: obj?.f_commentsStr ?? "", u_runDate: obj?.f_runDate ?? Date(), showSheet: $updateRunBool)
                        //UpdateRun(runsOOInput: self.runsOO, IDInput: $ID)
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
        PastRunsView(firebaseRunsVM: FirebaseRunsViewModel())
    }
}
