//  Created by TCode on 27/12/2020.

import UIKit

class ExploreTableViewController: UITableViewController {

    weak var coordinator: ExploreCoordinator?
    let dataProvider: DataProviding!

    private var topicCategories: [TopicCategory] = []

    init(dataProvider: DataProviding) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)

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
