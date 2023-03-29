//
//  NetworkProducts.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation

import Combine

protocol NetworkProductsProtocol {
    static func getAllProducts() async throws -> [Product]?
}

class NetworkProducts: NetworkProductsProtocol {
    
    static func getAllProducts() async throws -> [Product]? {
        do {
            let request = URLRequest(url: URL(string: "https://dummyjson.com/products")!)
            let (data,httpResponse) = try await URLSession.shared.data(for: request)
            guard (httpResponse as? HTTPURLResponse)?.statusCode == 200 else { throw ProductError.unknownError}
            return try JSONDecoder().decode(Products.self, from: data).products
            
        }  catch (let error) {
            throw ProductError.errorWithDesc(error)
        }
    }
    
}

