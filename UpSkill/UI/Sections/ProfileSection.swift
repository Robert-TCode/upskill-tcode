//  Created by TCode on 27/01/2021.

import Foundation
import UIKit

class ProfileSection: TableViewSection {
    
    var cellIdentifier: String {
        return "PorfileCellIdentifier"
    }

    var numberOfRows: Int {
        return 1
    }

    let name: String
    let title: String

    public init(name: String, title: String) {
        self.name = name
        self.title = title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProfileCell else {
            return UITableViewCell()
        }
        cell.configure(name: name, title: title)
        return cell
    }

    func height(forCellAt: IndexPath) -> CGFloat {
        return ProfileCell.suggestedHeight
    }
}
