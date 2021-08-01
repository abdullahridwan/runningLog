//
//  RunDataModel.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/31/21.
//

import Foundation


//@State private var sliderValue: Double = 0
//@State private var totalMileString: String = ""
//@State private var totalTimeString: String = ""
//@State private var caloriesBurnedString: String = ""
//@State private var commentsString: String = ""

struct Run: Identifiable, Codable{
    var id = UUID()
    var sliderVal: Double
    var totalMileStr: String
    var totalTimeStr: String
    var caloriesBurnedStr: String
    var commentsStr: String
    var runDate: Date
}


var testRunList: [Run] = [
    Run(sliderVal: 3.0, totalMileStr: "2", totalTimeStr: "30:32", caloriesBurnedStr: "550", commentsStr: "Comments String Super Strong Blah Blah", runDate: Date()),
    Run(sliderVal: 5.0, totalMileStr: "3", totalTimeStr: "31:32", caloriesBurnedStr: "400", commentsStr: "Comments String Super Strong Blah Blah", runDate: Date())
]


func dateToString(dateGiven: Date) -> String {
    let dateFormatter = DateFormatter()
    //dateFormatter.dateStyle = .short
    dateFormatter.dateFormat = "E, d MMM y"
    let dateStringRet: String = dateFormatter.string(from: dateGiven)
    
    print(dateStringRet)
    return dateStringRet
}
