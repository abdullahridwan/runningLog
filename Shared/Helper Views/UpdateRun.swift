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
    //@Binding var IDInput: UUID
//    @Binding var u_sliderValue: Double
//    @Binding var u_totalMileString: String
//    @Binding var u_totalTimeString: String
//    @Binding var u_caloriesBurnedString: String
//    @Binding var u_commentsString: String
    @State var IDInput: UUID
    @State var u_sliderValue: Double
    @State var u_totalMileString: String
    @State var u_totalTimeString: String
    @State var u_caloriesBurnedString: String
    @State var u_commentsString: String
    @State var u_runDate: Date
    
    
    @State private var showingAlert = false
    
    @State private var buttonSpring = false
    
    
    @Binding var showSheet: Bool
    


    
    var body: some View {
        //let obj = runsOOInput.listOfRuns.first(where: {$0.id == IDInput})
        NavigationView {
            //LabelTextFieldWithFormat(label: "Slider Value", whatItIs: "Slider value", bindingString: $u_sliderValue)
            VStack {
                VStack{
                    sliderComponent
                    DatePicker(selection: $u_runDate, in: ...Date(), displayedComponents: .date) {
                        Text("Select a date")
                    }
                    .padding(.bottom, 20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    LabelTextField(label: "Total Miles Ran", placeHolder: u_totalMileString, bindingString: $u_totalMileString)
                    LabelTextField(label: "Total Time", placeHolder: u_totalTimeString, bindingString: $u_totalTimeString)
                    LabelTextField(label: "Calories Burned", placeHolder: u_caloriesBurnedString, bindingString: $u_caloriesBurnedString)
                    VStack(alignment: .leading) {
                        Text("Quick Comments")
                            .font(.headline)
                        TextEditor(text: $u_commentsString)
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.3), lineWidth: 1))
                            //.padding(10)
                            .foregroundColor(.black)
                    }.padding(20)
                }
                .padding(.top, 5)
                .padding(.horizontal, 30)
                //.padding(.bottom, 50)
                
                //Spacer()
                HStack {
                    Button("Delete", action: {
                        showingAlert = true
                    })
                        .buttonStyle(GrowingButtonStyle(buttonColor: Color.red))
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("Delete this Entry?"), message: Text("This cannot be undone"), primaryButton: .default(
                            Text("Cancel"),
                            action: {}
                        ), secondaryButton: .destructive(
                            Text("Delete"),
                            action: {
                                deleteItemByID(objectID: IDInput, OOInput: runsOOInput)
                                showSheet.toggle()
                            }
                        ))
                    })
                    
                    Button("Update", action: {
                        updateItemByID(objectID: IDInput, OOInput: runsOOInput)
                        showSheet.toggle()
                    })
                        .buttonStyle(GrowingButtonStyle(buttonColor: Color.orange))
                }
                Spacer()
                Text("Swipe this down to dismiss")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.top, 20)
                Image(systemName: "chevron.down")
                    .padding(.bottom, 10)
                    .padding(.top, 7)
                    .offset(x: 0, y: buttonSpring ? 0 : -6)
                    .animation(Animation.easeOut.delay(0.6).repeatForever(), value: buttonSpring)
                    .onAppear{self.buttonSpring = true}
                
                
            }
            .navigationTitle("Update Your Run")
        }
    }
    
    
    var sliderComponent: some View {
        VStack {
            switch u_sliderValue {
            case 0...1:
                Text("You're just starting out")
                    .foregroundColor(.secondary)
            case 1...2:
                Text("You're a rising star")
                    .foregroundColor(.secondary)
            case 2...3:
                Text("You're world famous!")
                    .foregroundColor(.secondary)
            case 3...4:
                Text("Pretty Good! Getting the hang of this")
                    .foregroundColor(.secondary)
            case 4...5:
                Text("Easy Run! Feeling great!")
                    .foregroundColor(.secondary)
            default:
                Text("Move the Slider based on dificulty!")
                    .foregroundColor(.secondary)
            }
            Slider(value: $u_sliderValue, in: 0...5)
            Text("Current slider value: \(u_sliderValue, specifier: "%.2f")").font(.subheadline).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }.padding(.horizontal, 20)
    }
    
    
    
    //delete item from model
    func deleteItemByID(objectID: UUID, OOInput: RunsOO){
        OOInput.listOfRuns.removeAll(where: {$0.id == objectID})
    }
    
    func updateItemByID(objectID: UUID, OOInput: RunsOO){
        OOInput.listOfRuns.removeAll(where: {$0.id == objectID})
        OOInput.listOfRuns.append(Run(id: objectID, sliderVal: u_sliderValue, totalMileStr: u_totalMileString, totalTimeStr: u_totalTimeString, caloriesBurnedStr: u_commentsString, commentsStr: u_commentsString, runDate: u_runDate))
    }
    
}





struct UpdateRun_Previews: PreviewProvider {
    static var previews: some View {
        let obj = RunsOO()
        let objSpec = obj.listOfRuns[0]
        UpdateRun(runsOOInput: obj, IDInput: objSpec.id, u_sliderValue: objSpec.sliderVal , u_totalMileString: objSpec.totalMileStr, u_totalTimeString: objSpec.totalTimeStr, u_caloriesBurnedString: objSpec.caloriesBurnedStr, u_commentsString: objSpec.commentsStr, u_runDate: Date(), showSheet: .constant(true))
        //UpdateRun(runsOOInput: obj, IDInput: obj.listOfRuns[0].id)
    }
}
