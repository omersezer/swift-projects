//
//  Hike.swift
//  HikingApp
//
//  Created by Ömer Sezer on 20.09.2024.
//

import Foundation

struct Hike: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageURL: String
    let miles: Double
}
