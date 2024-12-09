//
//  ContentView.swift
//  Day Journal
//
//  Created by Brandon Howard on 12/6/24.
//

import SwiftUI
import SwiftData

struct JournalEntriesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \JournalEntry.date, order: .reverse) private var journalEntries: [JournalEntry]
    
    @State var showCreateView = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(journalEntries) {
                    listedJournalEntry in
                    
                    NavigationLink(destination:EditJournalEntryView(editingJournalEntry: listedJournalEntry)) {
                        JournalEntryRowView(journalEntryRow: listedJournalEntry)
                    }
                }
                .onDelete(perform: deleteJournalEntry)
                
            }
            .navigationTitle("\(journalEntries.count) Entries")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addJournalEntry) {
                        Label("Add Entry", systemImage: "doc")
                    }
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntryView()
            }
        }
        detail: {
            Text("Select an entry")
        }
    }
    
     func addJournalEntry() {
        withAnimation {
//            let newJournalEntry = JournalEntry(title: "New Entry Added", text: "Initial text of new entry", rating: Int.random(in: 0...5), date: Date())
//            
//            //Saving into SwiftData
//            modelContext.insert(newJournalEntry)
            showCreateView = true
        }
    }

     func deleteJournalEntry(offsets: IndexSet) {
        withAnimation {
            print(offsets)
            print(journalEntries)
            for index in offsets {
                modelContext.delete(journalEntries[index])
            }
        }
    }
}

#Preview {
    JournalEntriesListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
