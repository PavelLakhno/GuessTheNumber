//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by user on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к: \(Int(targetValue))")
                .frame(alignment: .leading)
                .font(.system(size: 15))
            
            HStack {
                Text("0")
                CustomSlider(currentValue: $currentValue, alpha: computeScore())
                Text("100")
            }
            
            Button("Проверь меня!", action: {
                showAlert.toggle()
            })
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text(Int(currentValue).formatted())
            }
            
            Button("Начать заново", action: {
                targetValue = Int.random(in: 0...100)
            })
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
