//
//  AuthorizationCollectionFlowLayout.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import UIKit

// MARK: - AuthorizationCollectionItemCalculator

/// Describes how CollectionFlowLayout looks in ViewController
protocol AuthorizationCollectionItemCalculator: AnyObject {
  /// Provides final collection configuration
  func load(for collectionView: UICollectionView)
}

// MARK: - AuthorizationDisplay

/// Describes how CollectionFlowLayout looks in Presenter
protocol AuthorizationDisplay: AnyObject {}

// MARK: - AuthorizationCollectionFlowLayout

final class AuthorizationCollectionFlowLayout: UICollectionView {
  // MARK: - Properties

  weak var dataFeeder: AuthorizationDataFeeder?
  weak var weakCollectionView: UICollectionView?
}

// MARK: - AuthorizationCollectionItemCalculator

extension AuthorizationCollectionFlowLayout: AuthorizationCollectionItemCalculator {
  func load(for collectionView: UICollectionView) {
    weakCollectionView = collectionView
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.rowHeight = UICollectionView.automaticDimension
    collectionView.separatorInset = .leftInfinite

    AuthorizationCellType.allCases.forEach {
      collectionView.register($0.cellClass, forCellWithReuseIdentifier: $0.reuseIdentifier)
    }
  }
}

// MARK: - AuthorizationDisplay

extension AuthorizationCollectionFlowLayout: AuthorizationDisplay {}

// MARK: - UICollectionViewDelegate

extension AuthorizationCollectionFlowLayout: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    dataFeeder?.itemClicked(at: indexPath)
  }
}

// MARK: - UICollectionViewDataSource

extension AuthorizationCollectionFlowLayout: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataFeeder?.numberOfItems(in: section) ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let model = dataFeeder?.getItem(at: indexPath) else {
      return UICollectionViewCell()
    }
    guard let cell = CollectionView.dequeueReusableCell(withIdentifier: model.cellIdentifier) else {
      return UICollectionViewCell()
    }
    if let moduleCell = cell as? AuthorizationModelCell {
      moduleCell.configure(with: model)
    }
    return cell
  }
}
