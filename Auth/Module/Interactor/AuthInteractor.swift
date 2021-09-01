//
//  AuthInteractor.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthWorker

/// Describes how interactor looks in Presenter
protocol AuthWorker: AnyObject {
  /// Provides intial data to display
  var initalData: [AuthCellModel] { get }
}

// MARK: - AuthInteractor

final class AuthInteractor {
  struct Appearance {}

  // MARK: - Properties

  weak var presenter: AuthReceiver?

  // MARK: - Private

  private let appearance = Appearance()
}

// MARK: - AuthWorker

extension AuthInteractor: AuthWorker {
  var initalData: [AuthCellModel] {
    return [AuthSkeletonCellModel(cellType: .headerSkeleton)]
  }
}
