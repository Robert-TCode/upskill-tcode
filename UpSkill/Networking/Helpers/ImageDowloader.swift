//
//  ImageDowloader.swift
//  UpSkill
//
//  Created by TCode on 03/01/2021.
//

import Foundation
import UIKit

class ImageDownloader {

    init() { }

    static func downloadSwiftImage(completion: @escaping (UIImage?) -> Void) {
        downloadImage(from: "https://developer.apple.com/swift/images/swift-og.png", completion: completion)
    }

    static func downloadImage(from url: String, completion: @escaping (UIImage?) -> Void) {

        guard let url = URL(string: url) else {
            return
        }

        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error downloading image from \(url). Error \(error)")
                completion(nil)
            }

            if let data = data {
                let image = UIImage(data: data)

                // todo cache image
                completion(image)
            }
        }.resume()
    }
}
