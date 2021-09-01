//
//  AuthTableSubtitleCellModel.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthTableSubtitleCellModel

/// Identifies Auth table subtitle
struct AuthTableSubtitleCellModel {
  let description: String
  let cellType: AuthCellType
}

// MARK: - AuthTableSubtitleCellModel

extension AuthTableSubtitleCellModel: AuthCellModel {
  var cellClass: UITableViewCell.Type {
    return cellType.cellClass
  }
}
