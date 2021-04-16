//
//  Cart.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI
import Combine

class Cart: ObservableObject {
    
    let id: String = UUID().uuidString
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    private var books: [Book] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    var totalPrice: Double {
        books.reduce(0.0, {$0 + $1.price})
    }
    
    var totalPriceText: String {
        return String(format: "%.2f", totalPrice) + " €"
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func remove(book: Book) {
        guard let id = books.firstIndex(where: {$0.id == book.id}) else {return}
        books.remove(at: id)
    }

}
