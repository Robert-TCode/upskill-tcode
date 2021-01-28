//  Created by TCode on 27/01/2021.

import Foundation
import UIKit

protocol TableViewSection {
    
    var cellIdentifier: String { get }
    var numberOfRows: Int { get }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func height(forCellAt: IndexPath) -> CGFloat
}
