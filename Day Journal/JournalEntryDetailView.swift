//
//  JournalEntryDetailView.swift
//  Day Journal
//
//  Created by Brandon Howard on 12/6/24.
//

import SwiftUI

struct JournalEntryDetailView: View {
    let detailJournalEntry: JournalEntry
    
    var body: some View {
        Group {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(detailJournalEntry.text)
                }
                .padding()
            }
            .navigationTitle(detailJournalEntry.title)
        }
    }
}

#Preview {
    NavigationStack {
        JournalEntryDetailView(detailJournalEntry: JournalEntry(title: "Household",
                                                                text: "Go to store",
                                                                rating: 5,
                                                                date: Date()))
    }
}
