//  Created by TCode on 24/12/2020.

import UIKit

class DashboardViewController: UIViewController {

    var coordinator: DashboardCoordinator?

    @Service var userSession: UserSession

    private var sections = [TableViewSection]()

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white

        configureSections()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubviews()
    }

    private func configureSections() {
        if let user = userSession.user {
            let userViewModel = UserViewModel(user: user)
            let profileSection = ProfileSection(userViewModel: userViewModel)
            tableView.register(ProfileCell.self, forCellReuseIdentifier: profileSection.cellIdentifier)
            sections.append(profileSection)
        }

//        let quoteSection = QuoteSection()
//        sections.append(quoteSection)
//
//        let progressSection = ProgressSection()
//        sections.append(progressSection)
//
//        let savedTopicsSection = SavedTopicsSection()
//        sections.append(savedTopicsSection)
    }

    private func configureSubviews() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Welcome, TCode\nHope you're killing it today!"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)

        view.addSubview(tableView)

        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)])
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()
}

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].tableView(tableView, cellForRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sections[indexPath.section].height(forCellAt: indexPath)
    }
}
