//
//  ProductStore.swift
//  NFCProductScanner
//
//  Created by Alfian Losari on 1/27/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

struct ProductStore {
    
    static let shared = ProductStore()
    
    private init() {}
    
    let products = [
        Product(id: "SKU-RES2-982019", name: "RESIDENT EVIL 2", description: """
    The original Resident Evil 2 was released in 1998 and has sold over 4,960,000 copies. The action centers around rookie cop Leon Kennedy and college student Claire Redfield as they fight to survive a mysterious viral outbreak within Raccoon City. The 1998 original was hailed as a gaming masterpiece and propelled Resident Evil into mainstream pop culture and the entertainment you know today.
    """, price: "$60.00", inStock: true, image: UIImage(named: "res2")),
        Product(id: "SKU-KH3-0119", name: "KINGDOM HEARTS 3", description: """
    KINGDOM HEARTS III tells the story of the power of friendship as Sora and his friends embark on a perilous adventure. Set in a vast array of Disney and Pixar worlds, KINGDOM HEARTS follows the journey of Sora, a young boy and unknowing heir to a spectacular power. Sora is joined by Donald Duck and Goofy to stop an evil force known as the Heartless from invading and overtaking the universe.
    """, price: "$60.00", inStock: true, image: UIImage(named: "kh3")),
        Product(id: "SKU-IPXSM-2018", name: "iPhone Xs Max", description: """
    Welcome to the big screens. Super Retina in two sizes — including the largest display ever on an iPhone. Even faster Face ID. The smartest, most powerful chip in a smartphone. And a breakthrough dual-camera system. iPhone XS is everything you love about iPhone. Taken to the extreme.
    """, price: "$999.00", inStock: false, image: UIImage(named: "xsmax"))
    ]
    
    
    func product(withID id: String) -> Product? {
        return products.first { $0.id.lowercased() == id.lowercased() }
    }
    
}
