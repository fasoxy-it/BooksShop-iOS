//
//  ContentView.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI

struct ContentView: View {
    
    var books: [Book] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Total")
                    Spacer()
                    Text("0.0 €")
                        .font(.title)
                }
                
                ForEach(books) {book in
                    BookRow(book: book)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(books: Book.testObject())
    }
}
