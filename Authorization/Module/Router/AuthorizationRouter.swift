//
//  AuthorizationRouter.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

// MARK: - AuthorizationTransfer

/// Describes how Router looks in Presenter
protocol AuthorizationTransfer: AnyObject {}

// MARK: - AuthorizationRouter

final class AuthorizationRouter {
  // MARK: - Properties

  weak var carrier: UIViewController?
}

// MARK: - AuthorizationTransfer

extension AuthorizationRouter: AuthorizationTransfer {}
