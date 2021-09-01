//
//  AuthSkeletonCellModel.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Foundation

// MARK: - AuthSkeletonCellModel

/// Identifies Auth table subtitle
struct AuthSkeletonCellModel {
  let cellType: AuthCellType
}

// MARK: - AuthCellModel

extension AuthSkeletonCellModel: AuthCellModel {
  var cellClass: UITableViewCell.Type {
    return cellType.cellClass
  }
}
