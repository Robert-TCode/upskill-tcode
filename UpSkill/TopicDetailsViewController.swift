//
//  TopicDetailsViewController.swift
//  UpSkill
//
//  Created by TCode on 27/12/2020.
//

import UIKit

class TopicDetailsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white
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
}
