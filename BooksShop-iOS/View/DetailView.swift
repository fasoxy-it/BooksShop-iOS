//
//  DetailView.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var cart: Cart
    @ObservedObject var book: Book
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(uiImage: book.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 300)
                    .cornerRadius(6)
                    .shadow(radius: 20)
                
                VStack (alignment: .leading) {
                    Text(book.title)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .lineLimit(nil)
                    
                    Text(book.author)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
                .padding(.leading, 10)
            }
            
            Text(book.description)
                .lineLimit(nil)
                .padding(.top, 30)
                .padding(.bottom, 30)
            
            Button(action: {
                self.book.selected.toggle()
                if self.book.selected {
                    self.cart.add(book: self.book)
                } else {
                    self.cart.remove(book: self.book)
                }
            }) {
                Text("\(book.priceText)")
                    .padding(EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
                    .foregroundColor(.white)
                    .font(.callout)
            }
            .background(book.selected ? Color.green : Color.black)
            .cornerRadius(100)
            .shadow(radius: 20)
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: Book.testObject()[3])
            .environmentObject(Cart())
    }
}
