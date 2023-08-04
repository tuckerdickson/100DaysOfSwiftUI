//
//  ContentView.swift
//  BetterRest
//
//  Created by Tucker Dickson on 8/1/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = "Your ideal bedtime is..."
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var calculatedBedtime: String {
        var bedTime = "Please set all parameters"
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            bedTime = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error!"
            bedTime = "Sorry, a problem arose while trying to calculate your bedtime."
        }
        
        return bedTime
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
                    Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                }
                
                Section(alertTitle) {
                    Text(calculatedBedtime)
                        .font(.largeTitle)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
