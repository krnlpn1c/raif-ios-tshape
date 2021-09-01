//
//  AuthorizationViewController.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import UIKit

// MARK: - AuthorizationRenderer

/// Describes how ViewController looks in Presenter
protocol AuthorizationRenderer: AnyObject {
  /// Reloads content
  func reloadContent()
}

// MARK: - AuthorizationViewWorker

/// Provides functionality for view
protocol AuthorizationViewWorker: AnyObject {}

// MARK: - Appearance

// Contains view controller appearence
private struct Appearance {
  let title = ""
}

// MARK: - AuthorizationViewController

public final class AuthorizationViewController: UIViewController {
  // MARK: - Properties

  var collectionItemCalculator: AuthorizationCollectionItemCalculator?
  var presenter: AuthorizationHandler?

  // MARK: - Initialisation

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Life cycle

  public override func loadView() {
    view = contentView
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationController()
    setupCollectionView()
    contentView.controller = self

    presenter?.loadContent()
  }

  // MARK: - Private

  private lazy var contentView = AuthorizationView()
  private let appearance = Appearance()

  private func setupCollectionView() {
    let collectionView = contentView.collectionView
    collectionItemCalculator?.load(for: collectionView)
  }

  private func setupNavigationController() {
    navigationController?.view.backgroundColor = .backgroundColor
    navigationItem.largeTitleDisplayMode = .never
    navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
      title: "",
      style: .plain,
      target: nil,
      action: nil
    )
  }
}

// MARK: - AuthorizationRenderer

extension AuthorizationViewController: AuthorizationRenderer {
  func reloadContent() {
    contentView.collectionView.reloadData()
  }
}

// MARK: - AuthorizationViewWorker

extension AuthorizationViewController: AuthorizationViewWorker {}
