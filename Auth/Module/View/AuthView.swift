//
//  AuthView.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Vienna

// MARK: - Appearance

/// Provides configuration for view
private struct Appearance {
  let tableViewInsets = UIEdgeInsets(.zero)
  let backgroundColor = UIColor.backgroundColor
}

// MARK: - AuthView

final class AuthView: UIView {
  // MARK: - Properties

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()

  weak var controller: AuthViewWorker?

  // MARK: - Initialisation

  init() {
    super.init(frame: .zero)
    backgroundColor = appearance.backgroundColor
    addSubviews()
    makeConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Internal

  /// Setups header view to table view
  func setupHeaderView(with text: String) {
    TableViewHeader.setupHeaderView(for: tableView, with: text, andStyle: .largeTitle)
  }

  // MARK: - Private

  private let appearance = Appearance()

  private func addSubviews() {
    addSubview(tableView)
  }

  private func makeConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor, constant: appearance.tableViewInsets.top),
      tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: appearance.tableViewInsets.left),
      tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -appearance.tableViewInsets.right),
      tableView.bottomAnchor.constraint(
        equalTo: safeAreaLayoutGuide.bottomAnchor, 
        constant: -appearance.tableViewInsets.bottom
      )
    ])
  }
}
