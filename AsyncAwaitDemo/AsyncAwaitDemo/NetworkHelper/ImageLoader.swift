//
//  ImageLoader.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation
import UIKit
import Combine

class ImageLoader: ObservableObject {
    var didImageUpdated = PassthroughSubject<UIImage,Never>()
    var newImage = UIImage() {
        didSet {
            didImageUpdated.send(newImage)
        }
    }
    
    init(imageURL: String) {
        do {
            Task {
                newImage = try await fetchImage(for: imageURL)
            }
        }
    }
    
    private func fetchImage(for urlString: String) async throws -> UIImage {
        do {
            let request = URLRequest(url: URL(string: urlString)!)
            let (data,response) = try await URLSession.shared.data(for:request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw ProductError.unknownError}
            let maybeImage = UIImage(data: data)
            guard let thumbnail = await maybeImage?.thumbnail else { throw ProductError.unknownError}
            return thumbnail
        }
    }
   
}
