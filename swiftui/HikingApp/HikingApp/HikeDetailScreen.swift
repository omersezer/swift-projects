//
//  HikeDetailScreen.swift
//  HikingApp
//
//  Created by Ömer Sezer on 20.09.2024.
//

import SwiftUI

struct HikeDetailScreen: View {
    let hike: Hike
    @State private var zoomed: Bool = false

    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }

            Text(hike.name)
                .font(.title)

            Text("\(hike.miles.formatted()) miles")

            Spacer()
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HikeDetailScreen(hike: Hike(name: "Tom, Dick an Harry Mountaint", imageURL: "tom", miles: 5.8))
    }
}
