//
//  CreateJournalEntryView.swift
//  Day Journal
//
//  Created by Brandon Howard on 12/7/24.
//

import SwiftUI
import SwiftData

struct CreateJournalEntryView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss)  var dismiss
    
    @State var title: String = String()
    @State var text: String = String()
    @State var rating: Double = 5.0
    @State var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                
                DatePicker("Date", selection: $date)
                
                Text(String(repeating: "⭐️", count: Int(rating)))
                Slider(value: $rating, in: 1...5, step: 1)
                
                Label("Add Detail:", systemImage: "")
                    .foregroundColor(.gray)
                
                TextEditor(text: $text)
            }
            .navigationTitle("New Journal Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: closeItem) {
                        Label("Close", systemImage: "xmark")
                    }
                }
                
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Save", systemImage: "")
                    }
                }
            }
        }
    }
    
     func addItem() {
        let newJournalEntry = JournalEntry(title: title, text: text, rating: rating, date: date)
        
        //Saving into SwiftData
        modelContext.insert(newJournalEntry)
        
        dismiss()
    }
    
     func closeItem() {
        dismiss()
    }
}

#Preview {
    CreateJournalEntryView()
}
