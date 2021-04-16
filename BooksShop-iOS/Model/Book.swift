//
//  Book.swift
//  BooksShop-iOS
//
//  Created by Mattia Fasoli on 16/04/21.
//

import SwiftUI
import Combine

class Book: ObservableObject {
    init(title: String, image: UIImage, author: String, description: String, price: Double) {
        self.title = title
        self.image = image
        self.author = author
        self.description = description
        self.price = price
    }
    
    let id: String = UUID().uuidString
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    let title: String
    let image: UIImage
    let author: String
    let description: String
    let price: Double
    
    var priceText: String {
        if selected {
            return "Selected"
        }
        return String(format: "%.2f", price) + " €"
    }
    
    var selected: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
}

#if DEBUG

extension Book {
    static func testObject() -> [Book] {
        return [
            Book(title: "Clean Code", image: UIImage(named: "cleancode")!, author: "Robert Martin", description: "Even bad code can function. But if code isn't clean, it can vring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. ut it doesn't have to be that way.", price: 28.27),
            Book(title: "Elegant Objects v.1", image: UIImage(named: "elegantobjects")!, author: "Yegor Bugayenko", description: "Yegor is a CTO and co-founder of Teamed.io, a software development company with a unique approach to management of distributed teams; a regular blogger at www.yegor256.com; a proud holder of PMP and OCMEA certifications; a hands-on Java developer and a lead architect of a few popular open source projects, including jcabi.com, takes.org, rultor.com and qulice.com. Yegor lives in Palo Alto, CA and Kyiv, Ukraine.", price: 39.28),
            Book(title: "Design Patterns", image: UIImage(named: "designpatterns")!, author: "Erich Gamma", description: "Capturing a wealth of experience about the design of object-oriented software, four top-notch designers present a catalog of simple and succinct solutions to commonly occurring design problems. Previously undocumented, these 23 patterns allow designers to create more flexible, elegant, and ultimately reusable designs without having to rediscover the design solutions themselves.", price: 48.21),
            Book(title: "Cracking the Coding Interview", image: UIImage(named: "crackingthecodinginterview")!, author: "Gayle Laakmann McDowell ", description: "Learn how to uncover the hints and hidden details in a question, discover how to break down a problem into manageable chunks, develop techniques to unstick yourself when stuck, learn (or re-learn) core computer science concepts, and practice on 189 interview questions and solutions.", price: 37.09),
        ]
    }
}

#endif
