//
//  AuthRouter.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthTransfer

/// Describes how Router looks in Presenter
protocol AuthTransfer: AnyObject {}

// MARK: - AuthRouter

final class AuthRouter {
  // MARK: - Properties

  weak var carrier: UIViewController?
}

// MARK: - AuthTransfer

extension AuthRouter: AuthTransfer {}
