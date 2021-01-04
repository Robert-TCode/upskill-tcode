//
//  TopicDetailsViewController.swift
//  UpSkill
//
//  Created by TCode on 27/12/2020.
//

import UIKit

class TopicDetailsViewController: UIViewController {

    weak var coordinator: ExploreCoordinator?

    let topicViewModel: TopicViewModel!

    init(topicViewModel: TopicViewModel) {
        self.topicViewModel = topicViewModel
        super.init(nibName: nil, bundle: nil)

        // Using unowned because the ViewModel should live at least as long as the VC
        topicViewModel.image.bind { [unowned self] newImage in
            DispatchQueue.main.async {
                self.imageView.image = newImage
            }
        }

        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = buttonRefresh

        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var buttonRefresh: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refresh(_:)))
        return button
    }()

    @objc private func refresh(_ sender: UIView) {
//        coordinator?.didSelectRefreshTopic()
        ImageDownloader.downloadSwiftImage { image in
            self.topicViewModel.image.value = image
        }
    }
}
