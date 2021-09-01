//
//  AuthorizationPresenter.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthorizationHandler

/// Describes how Presenter looks in ViewController
protocol AuthorizationHandler: AnyObject {
  /// Initiates process of content loading
  func loadContent()
}

// MARK: - AuthorizationDataFeeder

/// Describes how Presenter looks in TableFlowLayout
protocol AuthorizationDataFeeder: AnyObject {
  /// Provides information about elements count in section
  func numberOfItems(in section: Int) -> Int
  /// Returns element for specified indexPath
  func getItem(at indexPath: IndexPath) -> AuthorizationCellModel?
  /// Clicked at item
  func itemClicked(at indexPath: IndexPath)
}

// MARK: - AuthorizationReceiver

/// Describes how Presenter looks in Interactor
protocol AuthorizationReceiver: AnyObject {}

// MARK: - AuthorizationPresenter

final class AuthorizationPresenter {
  // MARK: - Properties

  weak var view: AuthorizationRenderer?
  weak var display: AuthorizationDisplay?
  weak var output: AuthorizationModuleOutput?
  var router: AuthorizationTransfer?
  var interactor: AuthorizationWorker?

  // MARK: - Private

  private var dataSource: [AuthorizationCellModel] = []

  private func reloadContent() {
    DispatchQueue.main.async {
      self.view?.reloadContent()
    }
  }
}

// MARK: - AuthorizationModuleInput

extension AuthorizationPresenter: AuthorizationModuleInput {}

// MARK: - AuthorizationHandler

extension AuthorizationPresenter: AuthorizationHandler {
  func loadContent() {
    dataSource = interactor?.initalData ?? []
    reloadContent()
  }
}

// MARK: - AuthorizationDataFeeder

extension AuthorizationPresenter: AuthorizationDataFeeder {
  func numberOfItems(in section: Int) -> Int {
    return dataSource.count
  }

  func getItem(at indexPath: IndexPath) -> AuthorizationCellModel? {
    guard indexPath.row < dataSource.count else {
      return nil
    }
    return dataSource[indexPath.row]
  }

  func itemClicked(at indexPath: IndexPath) {
    // TODO: add action
  }
}

// MARK: - AuthorizationReceiver

extension AuthorizationPresenter: AuthorizationReceiver {}
