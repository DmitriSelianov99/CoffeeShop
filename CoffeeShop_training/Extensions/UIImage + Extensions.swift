//
//  UIImage + Extensions.swift
//  CoffeeShop_training
//
//  Created by Дмитрий Сельянов on 21.11.2023.
//

import UIKit

extension UIImage {
    func resized(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}
