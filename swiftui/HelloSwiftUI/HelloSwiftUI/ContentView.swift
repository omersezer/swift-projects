//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Ömer Sezer on 15.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("coffe-machine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25), style: .continuous))

            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1719937050679-c3a2c9c67b0f?q=80&w=2972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")!) { image in
                image.resizable()
            } placeholder: {
                ProgressView("Downloading image...")
            }


            Text("First line")
                .foregroundStyle(.cyan)
                .font(.title3)
                .padding([.top, .bottom], 20)
            Text("Second line")
                .foregroundStyle(.green)
            Text("Third line")
            HStack {
                Text("Left")
                Text("Right")
                    .fontWeight(.heavy)
            }
        }.foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}
