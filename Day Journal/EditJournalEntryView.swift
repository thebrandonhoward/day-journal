//
//  EditJournalEntryView.swift
//  Day Journal
//
//  Created by Brandon Howard on 12/9/24.
//

import SwiftUI

struct EditJournalEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss)  var dismiss
    
    @State var editingJournalEntry: JournalEntry
    @State var editMode = false
    
    var body: some View {
        if editMode {
            Form {
                TextField("Title", text: $editingJournalEntry.title)
                
                DatePicker("Date", selection: $editingJournalEntry.date)
                
                Text(String(repeating: "⭐️", count: Int(editingJournalEntry.rating)))
                Slider(value: $editingJournalEntry.rating, in: 1...5, step: 1)
                
                TextEditor(text: $editingJournalEntry.text)
            }
            .navigationTitle("Edit Mode")
                .toolbar {
                    Button("Remove") {
                        modelContext.delete(editingJournalEntry)
                        dismiss()
                    }
                    .foregroundColor(.red)
                    
                    Button("Done") {
                        editMode = false
                    }
                    .bold()
                }
        }
        else{
            JournalEntryDetailView(detailJournalEntry: editingJournalEntry)
                .toolbar {
                    Button("Edit") {
                        editMode = true
                    }
                }
        }
    }
}

#Preview {
    NavigationStack {
        EditJournalEntryView(
            editingJournalEntry: JournalEntry(
                title: "Household",
                text: "Go to store",
                rating: 4.0,
                date: Date()))
    }
}
