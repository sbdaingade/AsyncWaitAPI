//
//  ProductDetailView.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import SwiftUI
import Combine

struct ProductDetailView: View {
    @ObservedObject var productDetailViewModel:  ProductDetailViewModel
  
    var body: some View {
        VStack {
            
            List(productDetailViewModel.images, id: \.self) { imgURL in
                AsyncImage(url: URL(string: imgURL)) { img in
                    img
                        .imageModifier()
                    
                } placeholder: {
                    Image(systemName: "mountain.2")
                        .imageModifier()
                }
            }
        }
        .navigationTitle("Details")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 123, title: "Sachin Daingade", description: "Test", price: 12, discountPercentage: 1, rating: 1.1, stock: 1, brand: "test", category: "test", thumbnail: "https://i.dummyjson.com/data/products/1/1.jpg", images: ["",""])
        ProductDetailView(productDetailViewModel: ProductDetailViewModel(withProduct: product))
    }
}
