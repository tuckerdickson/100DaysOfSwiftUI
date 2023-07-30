//
//  LengthView.swift
//  Challenge1
//
//  Created by Tucker Dickson on 7/29/23.
//

import SwiftUI

struct LengthView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "km"
    
    private let units = ["m", "km", "ft", "yd", "mi"]
    
    // Treating feet as the base unit to convert to before performing the final conversion
    private var baseNumber: Double {
        switch inputUnit {
        case "m":
            return 3.28084 * inputNumber
        case "km":
            return 3280.84 * inputNumber
        case "yd":
            return 3 * inputNumber
        case "mi":
            return 5280 * inputNumber
        default:
            return inputNumber
        }
    }
    
    private var outputNumber: Double {
        switch outputUnit {
        case "m":
            return baseNumber / 3.28084
        case "km":
            return baseNumber / 3280.84
        case "yd":
            return baseNumber / 3
        case "mi":
            return baseNumber / 5280
        default:
            return baseNumber
        }
    }
        
    private func getLabel(for unit: String) -> String {
        switch unit {
        case "m":
            return "meters"
        case "km":
            return "kilometers"
        case "yd":
            return "yards"
        case "mi":
            return "miles"
        default:
            return "feet"
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
                    TextField("Input length", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text(getLabel(for: inputUnit))
                }
            } header: {
                Text("Input length")
            }
            
            Section {
                // Output unit picker
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
                Text("Output length")
            }
        }
        .navigationTitle("Length")
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
