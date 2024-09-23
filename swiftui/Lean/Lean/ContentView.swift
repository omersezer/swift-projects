//
//  ContentView.swift
//  Lean
//
//  Created by Ömer Sezer on 21.09.2024.
//

import SwiftUI

struct ContentView: View {

//    @State private var name: String = ""
//    @State private var friends: [String] = []

    @State private var search: String = ""
    @State private var friends: [String] = ["Omer", "Ali", "Ayşe", "John", "Mary", "Steven", "Steve", "Jerry"]
    @State private var filteredFriends: [String] = []

    var body: some View {
        VStack {
//            TextField("Enter name", text: $name)
//                .textFieldStyle(.roundedBorder)
//                .onSubmit {
//                    friends.append(name)
//                    name = ""
//                }

            List(filteredFriends, id: \.self) { friend in
                Text(friend)
            }
            .listStyle(.plain)
            .searchable(text: $search)
            .onChange(of: search) {
                if search.isEmpty {
                    filteredFriends = friends
                } else {
                    filteredFriends = friends.filter { $0.contains(search) }
                }
            }

            Spacer()
        }
        .padding()
        .onAppear {
            filteredFriends = friends
        }
        .navigationTitle("Friends")
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
