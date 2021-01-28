//  Created by TCode on 28/01/2021.

import Foundation
import UIKit

extension UIImageView {
    func setImage(url: String?) {
        if let url = url {
            ImageDownloader.downloadImage(from: url) { downloadedImage in
                DispatchQueue.main.async {
                    self.image = downloadedImage
                }
            }
        }
    }
}
