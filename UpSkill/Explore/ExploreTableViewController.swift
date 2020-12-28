//
//  ExploreViewController.swift
//  UpSkill
//
//  Created by TCode on 27/12/2020.
//

import UIKit

struct Topic: Decodable {
    var title: String
    var description: String
}

struct TopicCategory: Decodable {
    var title: String
    var isUI: Bool
    var topics: [Topic]
}

class ExploreTableViewController: UITableViewController {

    weak var coordinator: ExploreCoordinator?
    let dataProvider: DataProviding!

    private var topicCategories: [TopicCategory] = []

    init(dataProvider: DataProviding) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)

        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        view.backgroundColor = .white

        self.tableView.delegate = self
        self.tableView.dataSource = self

        loadTableData()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func loadTableData() {
        dataProvider.getTopicCategories { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let categories):
                self.topicCategories = categories
                self.tableView.reloadData()
            case .failure(let error):
                // localize error
                print(error)
            }
        }
    }

    // Project configuration

    // Linter
    // Build scripts
    // xcconfig files + build config
    // multiple scehees
    // multiple targets

    // App architecture

    // Pds vs Carthage vs SPM
    // Use swift SPM
    // Multiple frameworks in an app
    // App architecture design patterns
    // Coordinators
    // Service Locator + shared protocols
    // MVVM and RxSwift

    // CI + CD

    // Fastlane https://www.raywenderlich.com/233168-fastlane-tutorial-getting-started
    // Build a pipeline
    // App circle or whatever CI/CD tolld
}

// MARK: - TableViewDelegate and TableViewDatasource

extension ExploreTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        topicCategories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topicCategories[section].topics.count
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        topicCategories[section].title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = topicCategories[indexPath.section].topics[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.didSelectTopic(topicCategories[indexPath.section].topics[indexPath.row])
    }
}
