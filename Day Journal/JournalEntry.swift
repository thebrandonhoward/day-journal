//
//  JournalEntry.swift
//  Day Journal
//
//  Created by Brandon Howard on 12/6/24.
//

import Foundation
import SwiftData

@Model
final class JournalEntry: Identifiable {
    var title: String = String()
    var text: String = String()
    var rating: Double = 5.0
    var date: Date = Date()
    
    init(title: String, text: String, rating: Double, date: Date) {
        self.title = title
        self.text = text
        self.rating = rating
        self.date = date
    }
}

//var journalEntries: [JournalEntry] = [
//    JournalEntry(title: "Household",
//                 text: "Go to store",
//                 rating: 4.0,
//                 date: Date()),
//    JournalEntry(title: "Holiday",
//                 text: "Do Christmas Shopping",
//                 rating: 5.0,
//                 date: Date.now.addingTimeInterval(-24 * -60 * -60)),
//    JournalEntry(title: "Outside",
//                 text: "Wash vehicle",
//                 rating: 5.0,
//                 date: Date.now.addingTimeInterval(-24 * -120 * -120)),
//]
