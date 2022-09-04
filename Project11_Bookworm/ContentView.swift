//
//  ContentView.swift
//  Project11_Bookworm
//
//  Created by admin on 22.08.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ]) var books : FetchedResults<Book>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack {
                                Text(book.title ?? "Unknown")
                                    .font(.headline)
                                    .foregroundColor(book.rating < 2 ? .pink : .primary)
                                Text(book.author ?? "Unknown author")
                            }
                            
                            .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                     EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView = true
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddBookView()
            }
        }
    }
    func deleteBook(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
            
        }
        //try? moc.save()
        //to try
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
