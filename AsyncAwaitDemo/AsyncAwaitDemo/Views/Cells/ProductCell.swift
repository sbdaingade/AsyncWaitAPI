//
//  ProductCell.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation
import Combine
import UIKit

class ProductCell: ObservableObject, Identifiable {

    private var cancallable = Set<AnyCancellable>()
    
    @Published public var title : String
    @Published public var productThumnail = UIImage()
    private var localProduct: Product
    
    init(withProduct product: Product) {
        self.localProduct = product
        self.title = product.title
        ImageLoader(imageURL: product.thumbnail).didImageUpdated.sink {[weak self] img in
            DispatchQueue.main.async {
                self?.productThumnail = img
            }
        }.store(in: &cancallable)
        
    }
    
    deinit {
        cancallable.forEach{$0.cancel()}
    }
    
}
