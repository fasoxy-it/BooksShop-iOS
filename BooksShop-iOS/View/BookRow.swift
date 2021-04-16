//
//  BookRow.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI

struct BookRow: View {
    
    let book: Book
    
    var body: some View {
        HStack {
            Image(uiImage: book.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
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
                
            }) {
                Text("\(book.priceText)")
                    .accentColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            }
            .background(Color.black)
            .cornerRadius(100)
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Book.testObject()[3])
    }
}
