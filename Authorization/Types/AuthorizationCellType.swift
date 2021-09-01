//
//  AuthorizationCellType.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Vienna

// MARK: - AuthorizationCellType

/// Describes cells used in Authorization module
enum AuthorizationCellType {
  // MARK: - Cases

  /// Identifies cell for table subtitle
  case chip

  // MARK: - Properties

  var reuseIdentifier: String {
    return cellClass.description()
  }

  var cellClass: UICollectionViewCell.Type {
    switch self {
    case .chip:
      return ChipCell.self
    }
  }
}

// MARK: - CaseIterable

extension AuthorizationCellType: CaseIterable {}
