//
//  Item.swift
//  Mustang Metrics
//
//  Created by Jack Ruttan on 2025-02-18.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
