//
//  RunList.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/4/21.
//

import SwiftUI

struct RunList: View {
    
    @ObservedObject var firebaseRunsVM : FirebaseRunsViewModel
    
    var body: some View {
        //Text("Check console")
        NavigationView {
            List(firebaseRunsVM.firebaseRuns){ singleRun in
//                HStack {
//                    Text(singleRun.f_caloriesBurnedStr)
//                    Spacer()
//                }
                HStack(alignment: .center) {
                    Image(systemName: "sun.max")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .padding(.all, 20)
                        .padding(.leading, 10)
                        .foregroundColor(Color.orange)
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("Miles: \(singleRun.f_totalMileStr)")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    
                        
                        Text("Calories Burned: \(singleRun.f_caloriesBurnedStr)")
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
            .navigationBarTitle("Past Workouts from Firebase")
        }
    }
}

struct RunList_Previews: PreviewProvider {
    static var previews: some View {
        RunList(firebaseRunsVM: FirebaseRunsViewModel())
    }
}
