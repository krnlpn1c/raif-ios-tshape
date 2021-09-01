//
//  AuthCellType.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Vienna

// MARK: - AuthCellType

/// Describes cells used in Auth module
enum AuthCellType {
  // MARK: - Cases

  /// Identifies cell for table subtitle
  case tableDescription
  /// Identifies header skeleton cell
  case headerSkeleton

  // MARK: - Properties

  var reuseIdentifier: String {
    return cellClass.description()
  }

  var cellClass: UITableViewCell.Type {
    switch self {
    case .tableDescription:
      return TitleSubtitleTableViewCell<TitleSubtitleCellUnlimitedTitleRowsGrayStyle>.self
    case .headerSkeleton:
      return HeaderSkeletonTableViewCell.self
    }
  }
}

// MARK: - CaseIterable

extension AuthCellType: CaseIterable {}
