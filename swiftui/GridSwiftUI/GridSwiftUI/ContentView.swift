//
//  ContentView.swift
//  GridSwiftUI
//
//  Created by Ömer Sezer on 21.09.2024.
//

import SwiftUI

struct ContentView: View {

    let animals = ["🦛", "🦏", "🐪", "🐂", "🦒", "🐎", "🐁", "🦧", "🦬", "🦌", "🐩", "🐐"]
    @State private var sliderValue: CGFloat = 1

    var body: some View {
        NavigationStack {
            VStack {
                Slider(value: $sliderValue, in: 1...8, step: 1)
                    .padding()

                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(Circle())

                List(self.animals.chunked(by: Int(sliderValue)), id: \.self) { chunk in
                    ForEach(chunk, id: \.self) { animal in
                        Text(animal)
                            .font(.system(size: 50))
                    }
                }
            }
        }.navigationTitle("Animals")
    }
}

#Preview {
    ContentView()
}
