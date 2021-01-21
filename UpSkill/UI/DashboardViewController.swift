//  Created by TCode on 24/12/2020.

import UIKit

class DashboardViewController: UIViewController {

    var coordinator: DashboardCoordinator?
    
    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Welcome, TCode\nHope you're killing it today!"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)

        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red

        view.addSubview(titleLabel)
        view.addSubview(redView)

        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                                     titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                                     redView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
                                     redView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                                     redView.heightAnchor.constraint(equalToConstant: 100),
                                     redView.widthAnchor.constraint(equalToConstant: 200)])
    }
  
}
