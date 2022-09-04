//
//  AddBookView.swift
//  Project11_Bookworm
//
//  Created by admin on 22.08.2022.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var review = ""
    @State private var genre = ""
    @State private var rating = 2
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of the Book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextField("Review the book", text: $review)
                    
                    RatingView(rating: $rating) 
                } header: {
                    Text("Write a review")
                }
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.date = Date.now
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                    
                }
                .disabled(isValid())
            }
            .navigationTitle("Add new Book")
        }
    }
    func isValid() -> Bool {
        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || genre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || review.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return true
        } else {
            return false
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
