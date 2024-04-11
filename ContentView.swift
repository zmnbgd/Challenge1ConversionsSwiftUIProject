//
//  ContentView.swift
//  Challenge1ConversionsSwiftUIProject
//
//  Created by Marko Zivanovic on 3.4.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = ""
    @State private var selectedInputUnit = 0.0
    @State private var selectedOutputUnit = 1.0
    
    let units = ["Milliliters", "Liters", "Deciliters", "Centiliters"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter value", text: $inputValue)
                        .keyboardType(.decimalPad)
                    
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0])
                        }
                    }
                }
            }
            .navigationTitle("Conversions")
        }
        Section(header: Text("Result")) {
            Picker("Output Unit", selection: $selectedOutputUnit) {
                ForEach(0..<units.count) {
                    Text(self.units[$0])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
