//
//  ProductCellView.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import SwiftUI

struct ProductCellView: View {
    @StateObject var product: ProductCell
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(uiImage: product.productThumnail)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .background(Color.purple)
                    .clipShape(Circle())

                Text("\(product.title)")
            }
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 123, title: "Sachin Daingade", description: "Test", price: 12, discountPercentage: 1, rating: 1.1, stock: 1, brand: "test", category: "test", thumbnail: "https://i.dummyjson.com/data/products/1/1.jpg", images: ["",""])
        
        ProductCellView(product: ProductCell(withProduct: product))
    }
}
