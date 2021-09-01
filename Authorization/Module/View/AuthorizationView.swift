//
//  AuthorizationView.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Vienna

// MARK: - Appearance

/// Provides configuration for view
private struct Appearance {
  let collectionViewInsets = UIEdgeInsets(.zero)
  let collectionViewSectionInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  let collectionViewScrollDirection: UICollectionView.ScrollDirection = .vertical
  let minimumInteritemSpacing = 0
  let minimumLineSpacing = 0
  let backgroundColor = UIColor.backgroundColor
}

// MARK: - AuthorizationView

final class AuthorizationView: UIView {
  // MARK: - Properties

  lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    return collectionView
  }()

  weak var controller: AuthorizationViewWorker?

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

  // MARK: - Private

  private let appearance = Appearance()

  private var collectionViewLayout: UICollectionViewLayout {
    let layout = UICollectionViewFlowLayout()
    let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.4

    layout.sectionInset = appearance.collectionViewSectionInsets
    layout.scrollDirection = appearance.collectionViewScrollDirection
    layout.minimumInteritemSpacing = appearance.minimumInteritemSpacing
    layout.minimumLineSpacing = appearance.minimumLineSpacing
    layout.itemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)

    return layout
  }

  private func addSubviews() {
    addSubview(collectionView)
  }

  private func makeConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor, constant: appearance.collectionViewInsets.top),
      collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: appearance.collectionViewInsets.left),
      collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -appearance.collectionViewInsets.right),
      collectionView.bottomAnchor.constraint(
        equalTo: safeAreaLayoutGuide.bottomAnchor, 
        constant: -appearance.collectionViewInsets.bottom
      )
    ])
  }
}
