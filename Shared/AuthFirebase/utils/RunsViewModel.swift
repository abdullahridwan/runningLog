//
//  RunsViewModel.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 8/6/21.
//

import Foundation
import Firebase


struct FirebaseRun: Codable, Identifiable {
    var id : String? //UUID().uuidString
    //var f_sliderVal: Double
    var f_totalMileStr: String
    //var f_totalTimeStr: String
    var f_caloriesBurnedStr: String
    //var f_commentsStr: String
    var f_runDate: Date
}



class FirebaseRunsViewModel: ObservableObject {
    @Published var firebaseRuns = [FirebaseRun]()
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    
//    func createFirebasePayload(calories: String, id: String, runDate: Date, totalMilesRan: String){
//        return [
//            "caloriesBurned": calories,
//            "id": id,
//            "runDate": runDate,
//            "totalMilesRan": totalMilesRan
//        ]
//    }
    
    
    func addRunToFirebase(docID: String, runDateInput: Date, caloriesBurnedInput: String, totalMilesStringInput: String) {
        if (user != nil) {
            db.collection("runningLogs").document(docID).collection("runs").addDocument(data: [
                "caloriesBurned": caloriesBurnedInput,
                "id": UUID().uuidString,
                "runDate": runDateInput,
                "totalMilesRan": totalMilesStringInput
            ])
        }
    }
    func fetchData2() {
        print("\n\nFetching Data 2\n")
        if (user != nil) {
            db.collection(user!.uid).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
    //                for document in querySnapshot!.documents {
    //                    print("\(document.documentID) => \(document.data())")
    //                }
                    guard let documents = querySnapshot?.documents else {
                        print("[RunstViewModel.swift] No Documents recieved")
                        return
                    }
                    
                    
                    self.firebaseRuns = documents.map({docSnapshot -> FirebaseRun in
                        let data = docSnapshot.data()

                        let docID = docSnapshot.documentID
                        let caloriesBurned = data["caloriesBurned"] as? String ?? ""
                        let totalMilesRan = data["totalMilesRan"] as? String ?? ""

                        // Get run date
                        let timeStamp = data["runDate"] as! Timestamp  //need a default provider
                        let runDateValue = timeStamp.dateValue()

                        return FirebaseRun(id: docID, f_totalMileStr: totalMilesRan, f_caloriesBurnedStr: caloriesBurned, f_runDate: runDateValue)
                    })
                }
            }
        }
    }
    
    func fetchData() {
        print("[RunsViewModel] fetching data...")
        if(user != nil){
            db.collection(user!.uid).addSnapshotListener({(snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("[RunstViewModel.swift] No Documents recieved")
                    return
                }
                
                
                self.firebaseRuns = documents.map({docSnapshot -> FirebaseRun in
                    let data = docSnapshot.data()

                    let docID = docSnapshot.documentID
                    let caloriesBurned = data["caloriesBurned"] as? String ?? ""
                    let totalMilesRan = data["totalMilesRan"] as? String ?? ""


                    // Get run date
                    let timeStamp = data["runDate"] as! Timestamp  //need a default provider
                    let runDateValue = timeStamp.dateValue()

                    return FirebaseRun(id: docID, f_totalMileStr: totalMilesRan, f_caloriesBurnedStr: caloriesBurned, f_runDate: runDateValue)
                })
                
                
            })
        }else{
            print("[RunsViewModel] User is NIL")
        }
    }
    
    // Delete a run.
    // Each User is a collection defined by the UID.
    // Each Run is a document
    func deleteRun(runID: String){
        if (user != nil){
            db.collection(user!.uid).document(runID).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
    
    func addRun(run: FirebaseRun){
        let newRunUUID : String = UUID().uuidString
        print("\n\nCheck if this UID is a doc id too:" , newRunUUID)
        
        if(user != nil){
            db.collection(user!.uid).document(newRunUUID).setData([
                "caloriesBurned": run.f_caloriesBurnedStr,
                "id": run.id ?? UUID().uuidString,
                "runDate": run.f_runDate,
                "totalMilesRan": run.f_totalMileStr
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
    
    
    
//    func fetchData(docId: String){
//        if(user != nil){
//            db.collection("runningLogs").document(docId).collection("runs").order(by: "runDate", descending: false).addSnapshotListener({(snapshot, error) in
//                guard let documents = snapshot?.documents else {
//                    print("No Documents")
//                    return
//                }
//
//                self.firebaseRuns = documents.map{docSnapshot -> FirebaseRun in
//                    let data = docSnapshot.data()
//
//                    let docID = docSnapshot.documentID
//                    let caloriesBurned = data["caloriesBurned"] as? String ?? ""
//
//                    // Get run date
//                    let timeStamp = data["runDate"] as! Timestamp  //need a default provider
//                    let runDateValue = timeStamp.dateValue()
//
//                    return FirebaseRun(id: docID, f_caloriesBurnedStr: caloriesBurned, f_runDate: runDateValue)
//                }
//            })
//        }
//    }
    
}
