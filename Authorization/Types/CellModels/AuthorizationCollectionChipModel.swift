//
//  AuthorizationCollectionChipModel.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Foundation

// MARK: - AuthorizationCollectionChipModel

/// Identifies Authorization collection chip cell
struct AuthorizationCollectionChipModel {
  let cellType: AuthorizationCellType
}

// MARK: - AuthorizationCellModel

extension AuthorizationCollectionChipModel: AuthorizationCellModel {
  var cellClass: UICollectionViewCell.Type {
    return cellType.cellClass
  }
}
