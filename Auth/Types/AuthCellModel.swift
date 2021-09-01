//
//  AuthCellModel.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthCellModel

/// Provides information about cells in Auth module
protocol AuthCellModel: BaseCellModel {
  /// Provides information about used type of cell
  var cellType: AuthCellType { get }
}
