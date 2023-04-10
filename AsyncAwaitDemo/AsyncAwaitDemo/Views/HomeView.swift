//
//  HomeView.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import SwiftUI
import Combine
struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            List(viewModel.arrOfProducts , id: \.id) { product in
                
                NavigationLink(destination: ProductDetailView(productDetailViewModel: ProductDetailViewModel(withProduct: product))) {
                    let product = ProductCell(withProduct: product)
                      ProductCellView(product: product)
                    }
                
              
            }
        }
        .padding()
        .toolbar {
            Button("Get products") {
                viewModel.input = .getAllProducts
            }
        }
        .onAppear(perform: getAllProducts)
    }
    
    private func getAllProducts() {
        viewModel.input = .getAllProducts
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
