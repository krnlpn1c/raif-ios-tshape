//
//  AuthPresenter.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthHandler

/// Describes how Presenter looks in ViewController
protocol AuthHandler: AnyObject {
  /// Initiates process of content loading
  func loadContent()
}

// MARK: - AuthDataFeeder

/// Describes how Presenter looks in TableFlowLayout
protocol AuthDataFeeder: AnyObject {
  /// Provides information about elements count in section
  func numberOfItems(in section: Int) -> Int
  /// Returns element for specified indexPath
  func getItem(at indexPath: IndexPath) -> AuthCellModel?
  /// Clicked at item
  func itemClicked(at indexPath: IndexPath)
  /// Updates navigation controller title when tableView title visibility changes
  func updateHeader(with currentPosition: CGFloat, andHeaderHeight height: CGFloat)
}

// MARK: - AuthReceiver

/// Describes how Presenter looks in Interactor
protocol AuthReceiver: AnyObject {}

// MARK: - AuthPresenter

final class AuthPresenter {
  // MARK: - Properties

  weak var view: AuthRenderer?
  weak var display: AuthDisplay?
  weak var output: AuthModuleOutput?
  var router: AuthTransfer?
  var interactor: AuthWorker?

  // MARK: - Private

  private var dataSource: [AuthCellModel] = []

  private func reloadContent() {
    DispatchQueue.main.async {
      self.view?.reloadContent()
    }
  }
}

// MARK: - AuthModuleInput

extension AuthPresenter: AuthModuleInput {}

// MARK: - AuthHandler

extension AuthPresenter: AuthHandler {
  func loadContent() {
    dataSource = interactor?.initalData ?? []
    reloadContent()
  }
}

// MARK: - AuthDataFeeder

extension AuthPresenter: AuthDataFeeder {
  func numberOfItems(in section: Int) -> Int {
    return dataSource.count
  }

  func getItem(at indexPath: IndexPath) -> AuthCellModel? {
    guard indexPath.row < dataSource.count else {
      return nil
    }
    return dataSource[indexPath.row]
  }

  func itemClicked(at indexPath: IndexPath) {
    // TODO: add action
  }

  func updateHeader(with currentPosition: CGFloat, andHeaderHeight height: CGFloat) {
    let isHidden = currentPosition > height
    view?.updateHeaderVisibility(to: isHidden)
  }
}

// MARK: - AuthReceiver

extension AuthPresenter: AuthReceiver {}
