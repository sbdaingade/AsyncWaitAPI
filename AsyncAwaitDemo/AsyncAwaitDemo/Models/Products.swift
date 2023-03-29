//
//  Products.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation

// MARK: - Products
struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
