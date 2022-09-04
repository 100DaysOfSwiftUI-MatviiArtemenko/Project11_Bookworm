//
//  DetailView.swift
//  Project11_Bookworm
//
//  Created by admin on 23.08.2022.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    @State private var onColor = Color.yellow
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .offset(x: -7, y: -7)
                
                
            }
            Text(book.date?.formatted(date: .abbreviated, time: .omitted) ?? "Unknown date")
            Text(book.author ?? "Unknown author. ")
                .font(.title)
                .foregroundColor(.secondary)
            Text(book.review ?? "No review.")
                .padding()
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
                .foregroundColor(changeColor(for: Int(book.rating)))
            
            
        }
        .navigationTitle(book.title ?? "Unknown.")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete?.", isPresented: $showingAlert) {
            Button("Delete.", role: .destructive) {
                deleteBook()
            }
            Button("Cancel.", role: .cancel) {}
        } message: {
            Text("Are you sure?.")
        }
        .toolbar {
            Button {
                showingAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        
    }
    func deleteBook() {
        moc.delete(book)
        
        //        try? moc.save()
        dismiss()
    }
    func changeColor(for number: Int) -> Color {
        switch number {
        case 1 :
            onColor = Color.pink
        case 2 :
            onColor = Color.orange
        case 5 :
            onColor = Color.yellow
        default :
            onColor = Color.green
        }
        return onColor
    }
}


