//
//  ContentView.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cart: Cart
    
    var books: [Book] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Total")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Text(cart.totalPriceText)
                        .font(.title)
                }
                
                ForEach(books, id: \.id) {book in
                    BookRow(book: book)
                        .environmentObject(self.cart)
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(books: Book.testObject())
            .environmentObject(Cart())
    }
}
