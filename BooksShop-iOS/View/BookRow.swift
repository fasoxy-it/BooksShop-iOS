//
//  BookRow.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI

struct BookRow: View {
    
    @EnvironmentObject var cart: Cart
    @ObservedObject var book: Book
    
    var body: some View {
        HStack {
            NavigationLink (
                destination:
                    DetailView(book: self.book)
                        .environmentObject(cart),
                label: {
                    Image(uiImage: book.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 100)
                        .cornerRadius(6)
                        .shadow(radius: 20)
                    
                    VStack (alignment: .leading) {
                        Text(book.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .lineLimit(nil)
                        Text(book.author)
                            .font(.caption)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.book.selected.toggle()
                        if self.book.selected {
                            self.cart.add(book: self.book)
                        } else {
                            self.cart.remove(book: self.book)
                        }
                    }) {
                        Text("\(book.priceText)")
                            .accentColor(.white)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    }
                    .background(book.selected ? Color.green : Color.black)
                    .cornerRadius(100)
            })
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book.testObject()[3])
            . environmentObject(Cart())
    }
}
