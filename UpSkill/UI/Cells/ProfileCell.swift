//  Created by TCode on 27/01/2021.

import Foundation
import UIKit

class ProfileCell: UITableViewCell {

    // MARK: Constants

    static let suggestedHeight: CGFloat = 100

    // MARK: Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configuration

    func configure(name: String, title: String) {
        self.nameLabel.text = name
        self.titleLabel.text = title
        // TODO profileImageView.image = load an image
    }

    private func configureUI() {

        let stackView = makeStackView()
        stackView.addArrangedSubviews(nameLabel, titleLabel)

        contentView.addSubviewWithoutConstraints(profileImageView)
        contentView.addSubviewWithoutConstraints(stackView)

        NSLayoutConstraint.activate([profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     profileImageView.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
                                     stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
                                     stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)])
    }

    // MARK: Subviews

    lazy var profileImageView: UIImageView = {
        let view = UIImageView()

        view.backgroundColor = .gray
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true

        let dimension: CGFloat = 50
        view.constraint(toSize: CGSize(width: dimension, height: dimension))
        view.setCornerRadius(to: dimension / 2)

        return view
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    // MARK: Helpers

    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fill

        return stackView
    }
}
