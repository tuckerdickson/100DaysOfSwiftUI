//
//  TimeView.swift
//  Challenge1
//
//  Created by Tucker Dickson on 7/29/23.
//

import SwiftUI

struct TimeView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "sec"
    @State private var outputUnit = "min"
    
    private let units = ["sec", "min", "hour", "day"]
    
    // Treating seconds as the base
    private var baseNumber: Double {
        switch inputUnit {
        case "min":
            return 60 * inputNumber
        case "hour":
            return 60 * 60 * inputNumber
        case "day":
            return 60 * 60 * 24 * inputNumber
        default:
            return inputNumber
        }
    }
    
    private var outputNumber: Double {
        switch outputUnit {
        case "min":
            return baseNumber / 60
        case "hour":
            return baseNumber / (60 * 60)
        case "day":
            return baseNumber / (60 * 60 * 24)
        default:
            return baseNumber
        }
    }
    
    func getLabel(for unit: String) -> String {
        switch unit {
        case "sec":
            return "second"
        case "min":
            return "minute"
        case "hour":
            return "hour"
        default:
            return "day"
        }
    }
    
    var body: some View {
        Form {
            Section {
                // Input units
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                // Input measurement
                HStack {
                    TextField("Input time", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text(getLabel(for: inputUnit))
                }
            } header: {
                Text("Input time")
            }
            
            Section {
                // Output units
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                // Output measurement
                HStack {
                    Text(outputNumber, format: .number)
                    Spacer()
                    Text(getLabel(for: outputUnit))
                }
            } header: {
                Text("Output time")
            }
        }
        .navigationTitle("Time")
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
