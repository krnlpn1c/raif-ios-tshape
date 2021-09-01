//
//  AuthTableFlowLayout.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import UIKit

// MARK: - AuthTableItemCalculator

/// Describes how TableFlowLayout looks in ViewController
protocol AuthTableItemCalculator: AnyObject {
  /// Provides final table configuration
  func load(for tableView: UITableView)
}

// MARK: - AuthDisplay

/// Describes how TableFlowLayout looks in Presenter
protocol AuthDisplay: AnyObject {}

// MARK: - AuthTableFlowLayout

final class AuthTableFlowLayout: UITableView {
  // MARK: - Properties

  weak var dataFeeder: AuthDataFeeder?
  weak var weakTableView: UITableView?
}

// MARK: - AuthTableItemCalculator

extension AuthTableFlowLayout: AuthTableItemCalculator {
  func load(for tableView: UITableView) {
    weakTableView = tableView
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorInset = .leftInfinite

    AuthCellType.allCases.forEach {
      tableView.register($0.cellClass, forCellReuseIdentifier: $0.reuseIdentifier)
    }
  }
}

// MARK: - AuthDisplay

extension AuthTableFlowLayout: AuthDisplay {}

// MARK: - UITableViewDelegate

extension AuthTableFlowLayout: UITableViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let currentPosition: CGFloat = scrollView.contentOffset.y
    let headerHeigth = weakTableView?.tableHeaderView?.frame.size.height ?? 0
    dataFeeder?.updateHeader(with: currentPosition, andHeaderHeight: headerHeigth)
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    dataFeeder?.itemClicked(at: indexPath)
  }
}

// MARK: - UITableViewDataSource

extension AuthTableFlowLayout: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataFeeder?.numberOfItems(in: section) ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let model = dataFeeder?.getItem(at: indexPath) else {
      return UITableViewCell()
    }
    guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) else {
      return UITableViewCell()
    }
    if let moduleCell = cell as? AuthModelCell {
      moduleCell.configure(with: model)
    }
    return cell
  }
}
