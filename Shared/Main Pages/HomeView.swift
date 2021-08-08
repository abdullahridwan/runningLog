//
//  HomeView.swift
//  runningLog (iOS)
//
//  Created by Abdullah Ridwan on 7/4/21.
//

import SwiftUI

struct HomeView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    @State private var runDate = Date()
    @State var showRunLogged = false
    
    @State private var sliderValue: Double = 0
    @State private var totalMileString: String = ""
    @State private var totalTimeString: String = ""
    @State private var caloriesBurnedString: String = ""
    @State private var commentsString: String = ""
    
    //@ObservedObject var runsOO: RunsOO
    @ObservedObject var firebaseRunsVM: FirebaseRunsViewModel
    
    
    var body: some View {
        VStack {
            NavigationView{
                VStack{
                    ScrollView{
                        HStack {
                            VStack(alignment: .center) {
                                sliderComponent
                                    .padding(.top, 5)
                                DatePicker(selection: $runDate, in: ...Date(), displayedComponents: .date) {
                                    Text("Select a date")
                                }
                                .padding(.bottom, 20)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            }
                            .padding(.horizontal, 15)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(
                            Color(.white)
                        )        .modifier(CardModifier())
                        .padding(.all, 10)
                        .padding(.bottom, 0)
                        
                        CardField(titleOf: "Total Miles Run", titleBinding: $totalMileString, placeholderText: "Total Miles", cardImage: Image(systemName: "hare.fill"), foregroundColor: Color.gray.opacity(0.7))
                            .padding(.bottom, 0)
                        CardField(titleOf: "Total Time", titleBinding: $totalTimeString, placeholderText: "Mins", cardImage: Image(systemName: "clock.fill"), foregroundColor: Color.blue.opacity(0.7))
                            .padding(.bottom, 0)
                        CardField(titleOf: "Calories Burned", titleBinding: $caloriesBurnedString, placeholderText: "Calories", cardImage: Image(systemName: "flame.fill"), foregroundColor: Color.red.opacity(0.7))
                            .padding(.bottom, 0)
                        LabelTextEditor(label: "Quick Comments", bindingString: $commentsString)
                            .padding(.bottom, 0)

                        
//                        Button("Log Run") {
//                            runsOO.listOfRuns.append(Run(sliderVal: sliderValue, totalMileStr: totalMileString, totalTimeStr: totalTimeString, caloriesBurnedStr: caloriesBurnedString, commentsStr: commentsString, runDate: runDate))
//
//                            self.showRunLogged.toggle()
//                        }
//                        .buttonStyle(GrowingButtonStyle(buttonColor: Color.blue))
//                            .sheet(isPresented: $showRunLogged) {
//                                        RunLogged()
//                            }
//                        Spacer()
                        
                        Button("Log Run") {
                            //firebaseRunsVM.addRun(run: FirebaseRun(id: UUID().uuidString, f_totalMileStr: totalMileString, f_caloriesBurnedStr: caloriesBurnedString, f_runDate: runDate))
                            firebaseRunsVM.addRun(run: FirebaseRun(id: UUID().uuidString, f_sliderVal: sliderValue, f_totalMileStr: totalMileString, f_totalTimeStr: totalTimeString, f_caloriesBurnedStr: caloriesBurnedString, f_commentsStr: commentsString, f_runDate: runDate))
                            
                            sliderValue = 0
                            totalMileString = ""
                            totalTimeString = ""
                            caloriesBurnedString = ""
                            commentsString = ""
                            
                            self.showRunLogged.toggle()

                        }
                        .buttonStyle(GrowingButtonStyle(buttonColor: Color.blue))
                            .sheet(isPresented: $showRunLogged) {
                                        RunLogged()
                            }
                        Spacer()


                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .navigationTitle(Text("Log Today's Run"))
                .onTapGesture {
                              self.hideKeyboard()
                            }
                }
            }
        }
        
        
    }
    
    
    
    
    var sliderComponent: some View {
        VStack {
            switch sliderValue {
            case 0...1:
                Text("Pretty hard but we'll get there!")
            case 1...2:
                Text("Getting the hang of it!")
            case 2...3:
                Text("Good Run!")
            case 3...4:
                Text("Light Run! Going to crush it next time!")
            case 4...5:
                Text("Easy Run! Feeling great!")
            default:
                Text("Move the Slider based on difficulty!")
            }
            Slider(value: $sliderValue, in: 0...5)
            Text("How did the run feel ? \(sliderValue, specifier: "%.2f")").font(.subheadline).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }.padding(20)
    }
    
}



struct LabelTextField : View {
    var label: String
    var placeHolder: String
    var bindingString: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(placeHolder, text: bindingString)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.3), lineWidth: 1))
                .keyboardType(.decimalPad)
                //.padding(10)
            }
            .padding(5)
            .padding(.horizontal, 15)
    }
}

struct LabelTextEditor : View {
    var label: String
    //var placeHolder: String
    var bindingString: Binding<String>
    
    var body: some View {
        HStack {
            Image(systemName: "pencil")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                //.padding(.all, 20)
                .padding(.leading, 20)
                .foregroundColor(
                    Color.green.opacity(0.7)
                )
            VStack(alignment: .leading) {
                Text(label)
                    .font(.headline)
                TextEditor(text: bindingString)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.3), lineWidth: 1))
                    //.padding(10)
                    .foregroundColor(.black)
            }.padding(20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        //.background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .background(
            Color(.white)
        )        .modifier(CardModifier())
        .padding(.all, 10)
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(firebaseRunsVM: FirebaseRunsViewModel())
    }
}
