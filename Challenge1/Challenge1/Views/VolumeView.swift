//
//  VolumeView.swift
//  Challenge1
//
//  Created by Tucker Dickson on 7/29/23.
//

import SwiftUI

struct VolumeView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "ml"
    @State private var outputUnit = "l"
    
    private let units = ["ml", "l", "c", "pt", "gal"]
    
    // Treating cup as base
    private var baseNumber: Double {
        switch inputUnit {
        case "ml":
            return inputNumber / 236.588
        case "l":
            return inputNumber / 0.236588000006399
        case "pt":
            return 2 * inputNumber
        case "gal":
            return 16 * inputNumber
        default:
            return inputNumber
        }
    }
    
    private var outputNumber: Double {
        switch outputUnit {
        case "ml":
            return baseNumber * 236.588
        case "l":
            return baseNumber * 0.236588000006399
        case "pt":
            return baseNumber / 2
        case "gal":
            return baseNumber / 16
        default:
            return baseNumber
        }
    }
    
    private func getLabel(for unit: String) -> String {
        switch unit {
        case "ml":
            return "milliliter"
        case "l":
            return "liter"
        case "c":
            return "cup"
        case "pt":
            return "pint"
        default:
            return "gallon"
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
                    TextField("Input volume", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text(getLabel(for: inputUnit))
                }
            } header: {
                Text("Input volume")
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
                Text("Output volume")
            }
        }
        .navigationTitle("Volume")
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
