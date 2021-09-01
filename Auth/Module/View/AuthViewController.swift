//
//  AuthViewController.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import UIKit

// MARK: - AuthRenderer

/// Describes how ViewController looks in Presenter
protocol AuthRenderer: AnyObject {
  /// Updates navigation controller title when tableView title visibility changes
  func updateHeaderVisibility(to isHidden: Bool)
  /// Reloads content
  func reloadContent()
}

// MARK: - AuthViewWorker

/// Provides functionality for view
protocol AuthViewWorker: AnyObject {}

// MARK: - Appearance

// Contains view controller appearence
private struct Appearance {
  let title = ""
}

// MARK: - AuthViewController

public final class AuthViewController: UIViewController {
  // MARK: - Properties

  var tableItemCalculator: AuthTableItemCalculator?
  var presenter: AuthHandler?

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
    setupTableView()
    contentView.controller = self

    presenter?.loadContent()
  }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    contentView.setupHeaderView(with: appearance.title)
  }

  // MARK: - Private

  private lazy var contentView = AuthView()
  private let appearance = Appearance()

  private func setupTableView() {
    let tableView = contentView.tableView
    tableItemCalculator?.load(for: tableView)
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

// MARK: - AuthRenderer

extension AuthViewController: AuthRenderer {
  func updateHeaderVisibility(to isHidden: Bool) {
    title = isHidden ? appearance.title : ""
  }

  func reloadContent() {
    contentView.tableView.reloadData()
  }
}

// MARK: - AuthViewWorker

extension AuthViewController: AuthViewWorker {}
