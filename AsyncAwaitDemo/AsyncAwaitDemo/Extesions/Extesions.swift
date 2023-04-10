//
//  Extesions.swift
//  AsyncAwaitDemo
//
//  Created by Sachin Daingade on 29/03/23.
//

import Foundation
import UIKit
import SwiftUI
import Combine

public enum ProductError: Error, CustomStringConvertible {
    case unknownError
    case errorWithDesc(Error)
    
    public var description: String {
        switch self {
        case .unknownError:
            return "Unknown error"
        case .errorWithDesc(let error):
            return error.localizedDescription
        }
    }
}


extension UIImage {
    var thumbnail: UIImage {
        get async {
            let size = CGSize(width: 45, height: 45)
            return await self.byPreparingThumbnail(ofSize: size)!
        }
    }
}


extension Image {
    
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
//    func iconModifier() -> some View {
//        self
//            .iconModifier()
//            .frame(maxWidth: 128)
//            .foregroundColor(.purple)
//    }
}
