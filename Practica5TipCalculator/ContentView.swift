//
//  ContentView.swift
//  Practica5TipCalculator
//
//  Created by ByRamon on 22/02/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCuenta = ""
    @State private var noPersonas = 2
    @State private var porcPropina = 2
    let porcPropinas = [10,15,20,25,0]
    var totalPorPersona: Double{
        let nPersonas = Double(noPersonas + 2)
        let pPropina = Double(porcPropinas[porcPropina])
        let total = Double(totalCuenta) ?? 0
        let totalPropina = total/100*pPropina
        let tCuenta = total + totalPropina
        let pPersona = tCuenta / nPersonas
        return pPersona
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Total de la cuenta", text: $totalCuenta).keyboardType(.decimalPad)
                    Picker("Número de personas", selection: $noPersonas){
                        ForEach(2 ..< 100){ index in
                            Text("\(index) personas")
                        }
                    }
                }
                Section(header: Text("¿Cuanta propina deseas dar?")){
                    Picker("Porcentaje propina", selection: $porcPropina){
                        ForEach(0 ..< porcPropinas.count){
                            Text("\(self.porcPropinas[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalPorPersona, specifier: "%.2f")")
                    //Text("$\(calcular())")
                }
            }.navigationBarTitle("Calculadora de Propinas")
        }
    }
    /*
    func calcular() -> Double{
        let nPersonas = Double(noPersonas + 2)
        let pPropina = Double(porcPropinas[porcPropina])
        let total = Double(totalCuenta) ?? 0
        let totalPropina = total/100*pPropina
        let tCuenta = total + totalPropina
        let pPersona = tCuenta / nPersonas
        return pPersona
    }*/
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
