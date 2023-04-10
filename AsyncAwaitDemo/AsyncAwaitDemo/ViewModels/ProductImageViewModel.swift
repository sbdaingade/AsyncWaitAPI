//
//  ProductImageViewModel.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation
import UIKit
import Combine

class ProductImageViewModel:ObservableObject, Identifiable {
   
    private var cancallable = Set<AnyCancellable>()
    @Published public var productThumnail = UIImage()

    init(withURL urlString: String) {
        ImageLoader(imageURL: urlString).didImageUpdated.sink {[weak self] img in
            DispatchQueue.main.async {
                self?.productThumnail = img
            }
        }.store(in: &cancallable)
    }

    deinit {
        cancallable.forEach{$0.cancel()}
    }
}


