//
//  HomeViewModel.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    enum Input {
        case getAllProducts
    }
    
    @Published public var input: Input?
    @Published public private(set) var arrOfProducts = [Product]()
    private var cancallable = Set<AnyCancellable>()
    
    init() {
        $input.compactMap{$0}.sink { [unowned self] action in
            switch action {
            case .getAllProducts:
                DispatchQueue.main.async {
                    Task {
                        self.arrOfProducts = try await NetworkProducts.getAllProducts() ?? []
                    }
                }
            }
        }.store(in: &cancallable)
    }
    
    deinit {
        cancallable.forEach{$0.cancel()}
    }
}
