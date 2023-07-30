//
//  TemperatureView.swift
//  Challenge1
//
//  Created by Tucker Dickson on 7/29/23.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "f"
    @State private var outputUnit = "c"
    
    private let units = ["f", "c", "k"]
    
    // Treating celsius as the base unit
    private var baseNumber: Double {
        switch inputUnit {
        case "f":
            return (5/9) * (inputNumber - 32)
        case "k":
            return inputNumber - 273.15
        default:
            return inputNumber
        }
    }
    
    private var outputNumber: Double {
        switch outputUnit {
        case "f":
            return ((9/5) * baseNumber) + 32
        case "k":
            return baseNumber + 273.15
        default:
            return baseNumber
        }
    }
    
    private func getLabel(for unit: String) -> String {
        switch unit {
        case "c":
            return "celsius"
        case "k":
            return "kelvin"
        default:
            return "fahrenheit"
            
        }
    }
    
    var body: some View {
        Form {
            Section {
                // Input unit picker
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                // Input measurement
                HStack {
                    TextField("Input temperature", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text(getLabel(for: inputUnit))
                }
            } header: {
                Text("Input temperature")
            }
            
            Section {
                // Output unit
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
                Text("Output temperature")
            }
        }
        .navigationTitle("Temperature")
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
