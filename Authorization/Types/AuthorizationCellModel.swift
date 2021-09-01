//
//  AuthorizationCellModel.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthorizationCellModel

/// Provides information about cells in Authorization module
protocol AuthorizationCellModel: BaseCellModel {
  /// Provides information about used type of cell
  var cellType: AuthorizationCellType { get }
}
