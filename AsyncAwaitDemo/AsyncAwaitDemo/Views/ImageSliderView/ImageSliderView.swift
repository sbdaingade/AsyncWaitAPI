//
//  ImageSliderView.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import SwiftUI
import Combine
import UIKit

struct ImageSliderView: View {
    @StateObject var productDetailViewModel:  ProductDetailViewModel
    
    var body: some View {
      //  TabView {
            List(productDetailViewModel.images, id: \.self) { strURL in
                
                Image(uiImage: ProductImageViewModel(withURL: strURL).productThumnail)
                    .resizable()
                    .scaledToFill()
            }
      //  }
      //  .tabViewStyle(PageTabViewStyle())
    }
}



struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 123, title: "Sachin Daingade", description: "Test", price: 12, discountPercentage: 1, rating: 1.1, stock: 1, brand: "test", category: "test", thumbnail: "https://i.dummyjson.com/data/products/1/1.jpg", images: ["",""])

        ImageSliderView(productDetailViewModel: ProductDetailViewModel(withProduct: product))
                    .previewLayout(.fixed(width: 400, height: 300))
    }
}
