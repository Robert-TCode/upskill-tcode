//  Created by TCode on 29/01/2021.

import Foundation
import UIKit

class TopicView: UIView {
    let topic: TopicViewModel

    init(topic: TopicViewModel) {
        self.topic = topic
        super.init(frame: .zero)

        backgroundColor = .clear
        configureUI()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        let stackView = makeStackView()
        stackView.addArrangedSubviews(titleLabel, descriptionLabel)
        addSubviewsWithoutConstraints(levelLabel, topicImageView, stackView)

        stackView.pin(edges: Edge.vertical, to: self)

        NSLayoutConstraint.activate([
            topicImageView.topAnchor.constraint(equalTo: self.topAnchor),
            topicImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            levelLabel.topAnchor.constraint(equalTo: topicImageView.bottomAnchor, constant: 8),
            levelLabel.widthAnchor.constraint(equalTo: topicImageView.widthAnchor),
            levelLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            levelLabel.heightAnchor.constraint(equalToConstant: 26),
            stackView.leadingAnchor.constraint(equalTo: topicImageView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setCornerRadius(to: 3)
        label.backgroundColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .primaryText
        label.font = UIFont.custom(size: 17)

        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.setCornerRadius(to: 3)
        label.backgroundColor = .gray
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .primaryText
        label.font = UIFont.custom(size: 17)

        return label
    }()

    lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.setCornerRadius(to: 3)
        label.backgroundColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .primaryText
        label.font = UIFont.custom(size: 17)

        return label
    }()

    lazy var topicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.constraint(toSize: CGSize(width: 68, height: 50))
        imageView.contentMode = .scaleAspectFill
        // todo add missing fields in topic view model
        // todo fix the warnings in the console
        imageView.image = topic.image.value
        return imageView
    }()
}
