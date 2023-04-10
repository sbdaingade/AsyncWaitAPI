//
//  ProductDetailViewModel.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation
import UIKit
import Combine

class ProductDetailViewModel: ObservableObject, Identifiable {

    private var cancallable = Set<AnyCancellable>()
    
    @Published public var title : String
    @Published public var productThumnail = UIImage()
    @Published public var images : [String]
    private var localProduct: Product
    
    init(withProduct product: Product) {
        self.localProduct = product
        self.title = product.title
        self.images = product.images
        
        ImageLoader(imageURL: product.thumbnail).didImageUpdated.sink {[weak self] img in
            DispatchQueue.main.async {
                self?.productThumnail = img
            }
        }.store(in: &cancallable)
        
    }
    
    func fetchImageFromURL(urlString: String) async throws -> UIImage {
        do {
            let request = URLRequest(url: URL(string: urlString)!)
            let (data,response) = try await URLSession.shared.data(for:request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw ProductError.unknownError}
            let maybeImage = UIImage(data: data)
            guard let thumbnail = await maybeImage?.thumbnail else { throw ProductError.unknownError}
            return thumbnail
        }
    }
    
    deinit {
        cancallable.forEach{$0.cancel()}
    }
    
}
