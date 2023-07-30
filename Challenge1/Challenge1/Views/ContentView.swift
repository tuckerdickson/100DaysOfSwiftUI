//
//  ContentView.swift
//  Challenge1
//
//  Created by Tucker Dickson on 7/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                // Length
                NavigationLink(destination: LengthView()) {
                    Image(systemName: "ruler")
                    Text("Length")
                }
                
                // Temperature
                NavigationLink(destination: TemperatureView()) {
                    Image(systemName: "thermometer.medium")
                    Text("Temperature")
                }
                
                // Time
                NavigationLink(destination: TimeView()) {
                    Image(systemName: "stopwatch")
                    Text("Time")
                }
                
                // Volume
                NavigationLink(destination: VolumeView()) {
                    Image(systemName: "cube.transparent")
                    Text("Volume")
                }
            }
            .navigationTitle("UnitPal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
