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
    
    
    var convertedValue: Double {
        let inputValue = Double(self.inputValue) ?? 0
        let liters = inputValue / 1000
        
        var outputLiters: Double = 0
        
        switch selectedInputUnit {
        case 0: // Milliliters
            outputLiters = liters
        case 1: // Liters
            outputLiters = inputValue
        case 2: // Deciliters
            outputLiters = liters / 10
        case 3: // Centiliters
            outputLiters = liters / 100
        default:
            break
        }
        
        var outputValue: Double = 0
        
        switch selectedOutputUnit {
        case 0: // Milliliters
            outputValue = outputLiters * 1000
        case 1: // Liters
            outputValue = outputLiters
        case 2: // Deciliters
            outputValue = outputLiters * 10
        case 3: // Centiliters
            outputValue = outputLiters * 100
        default:
            break
        }
        
        return outputValue
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter value", text: $inputValue)
                        .keyboardType(.decimalPad)
                    
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(0..<units.count) { index in
                            //Text(self.units[$0])
                            Text(self.units[index]).tag(Double(index))
                        }
                    }
                }
                //MARK:
                Section(header: Text("Output Unit")) { // Moved this section inside Form
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(0..<units.count) { index in
                            //Text(self.units[$0])
                            Text(self.units[index]).tag(Double(index))
                        }
                    }
                }
                Section(header: Text("Result")) {
                    Text("\(convertedValue, specifier: "%.2f") \(units[Int(selectedOutputUnit)])")
                }
            }
            .navigationTitle("Conversions")
        }
//        Section(header: Text("Result")) {
//            Picker("Output Unit", selection: $selectedOutputUnit) {
//                ForEach(0..<units.count) {
//                    Text(self.units[$0])
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
