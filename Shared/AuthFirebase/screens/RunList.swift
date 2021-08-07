//
//  RunList.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/4/21.
//

import SwiftUI

struct RunList: View {
    
    @ObservedObject var firebaseRunsVM = FirebaseRunsViewModel()
    
    init() {
        firebaseRunsVM.fetchData2()
    }
    
    var body: some View {
        //Text("Check console")
        NavigationView {
            List(firebaseRunsVM.firebaseRuns){ singleRun in
                HStack {
                    Text(singleRun.f_caloriesBurnedStr)
                    Spacer()
                }
            }
            .navigationBarTitle("Some Title")
        }
    }
}

struct RunList_Previews: PreviewProvider {
    static var previews: some View {
        RunList()
    }
}
