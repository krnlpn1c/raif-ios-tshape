//
//  AuthorizationInteractor.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthorizationWorker

/// Describes how interactor looks in Presenter
protocol AuthorizationWorker: AnyObject {
  /// Provides intial data to display
  var initalData: [AuthorizationCellModel] { get }
}

// MARK: - AuthorizationInteractor

final class AuthorizationInteractor {
  struct Appearance {}

  // MARK: - Properties

  weak var presenter: AuthorizationReceiver?

  // MARK: - Private

  private let appearance = Appearance()
}

// MARK: - AuthorizationWorker

extension AuthorizationInteractor: AuthorizationWorker {
  var initalData: [AuthorizationCellModel] {
    return [AuthorizationCollectionChipModel(cellType: .chip)]
  }
}
