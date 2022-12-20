//
//  CustomSlider.swift
//  GuessTheNumber
//
//  Created by user on 20.12.2022.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var currentValue: Double

    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changedValue),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alpha) / 100)
    }
   
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changedValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(currentValue: .constant(0), alpha: 1)
    }
}
