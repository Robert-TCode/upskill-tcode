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

    private static let cache = NSCache<NSString, UIImage>()

    static func downloadSwiftImage(completion: @escaping (UIImage?) -> Void) {
        downloadImage(from: "https://developer.apple.com/swift/images/swift-og.png", completion: completion)
    }

    static func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {

        if let image = cache.object(forKey: urlString as NSString) {
            completion(image)
            return
        }

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error downloading image from \(url). Error \(error)")
                completion(nil)
            }

            if let data = data {
                let image = UIImage(data: data)

                if let validImage = image {
                    cache.setObject(validImage, forKey: urlString as NSString)
                }

                completion(image)
            }
        }.resume()
    }
}
