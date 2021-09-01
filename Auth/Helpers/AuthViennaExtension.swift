//
//  AuthViennaExtension.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Vienna

// MARK: - HeaderSkeletonTableViewCell

extension HeaderSkeletonTableViewCell: AuthModelCell {
  func configure(with model: AuthCellModel) {
    startAnimation()
  }
}

// MARK: - TitleSubtitleTableViewCell

extension TitleSubtitleTableViewCell: AuthModelCell {
  func configure(with model: AuthCellModel) {
    guard let titleModel = model as? AuthTableSubtitleCellModel else {
      return
    }

    configure(title: titleModel.description, additionalText: nil)
    accessibilityIdentifier = "TitleSubtitleTableViewCell"
    setAccessibilityIdentifier(
      contentViewIdentifier: "ContentView",
      titleIdentifier: "TitleLabel",
      descriptionIdentifier: "DescriptionLabel"
    )
  }
}
