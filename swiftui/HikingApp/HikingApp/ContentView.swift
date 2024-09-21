//
//  ContentView.swift
//  HikingApp
//
//  Created by Ömer Sezer on 20.09.2024.
//

import SwiftUI

struct ContentView: View {
    let hikes = [Hike(name: "Samonberry Trail", imageURL: "sam", miles: 6),
                 Hike(name: "Tom, Dick an Harry Mountaint", imageURL: "tom", miles: 5.8),
                 Hike(name: "Tamanawas Falls", imageURL: "tam", miles: 5)]


    var body: some View {
        NavigationStack {
            List(hikes) { hike in
                NavigationLink(value: hike) {
                    HikeCellView(hike: hike)
                }
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailScreen(hike: hike)
                }

        }
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    let hike: Hike

    var body: some View {
        HStack(alignment: .top) {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 16), style: .continuous))
                .frame(width: 100)
            VStack(alignment: .leading) {
                Text(hike.name)
                Text("\(hike.miles.formatted()) miles")
            }
        }
    }
}
