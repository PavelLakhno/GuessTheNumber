//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by user on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к: \(Int(value))")
                .frame(alignment: .leading)
                .font(.system(size: 15))
                
            HStack {
                Text("0")
                Slider(value: $value, in: 0...100)
                Text("100")
            }
            Button("Проверь меня!", action: {})
            Button("Начать заново", action: {})
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
