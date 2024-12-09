//
//  JournalEntryRowView.swift
//  Day Journal
//
//  Created by Brandon Howard on 12/6/24.
//

import SwiftUI

struct JournalEntryRowView: View {
    let journalEntryRow: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    Text(journalEntryRow.title)
                        .bold()
                    Text(" - ")
                    Text("\(journalEntryRow.text.prefix(10))...")
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            
            Group {
                HStack {
                    Text(journalEntryRow.date, style: .date)
                        .foregroundColor(.secondary)
                    Text(String(repeating: "⭐️", count: Int(journalEntryRow.rating)))
                }
                .font(.caption)
                .padding()
            }
        }
    }
}

#Preview {
    List {
        JournalEntryRowView(journalEntryRow: JournalEntry(
            title: "Household",
            text: "Go to store",
            rating: 5,
            date: Date()))
    }
}
