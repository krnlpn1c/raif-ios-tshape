//
//  AuthorizationUserStory.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import RFModule
import Swinject

// MARK: - AuthorizationModuleInput

public protocol AuthorizationModuleInput: AnyObject {}

// MARK: - AuthorizationModuleOutput

public protocol AuthorizationModuleOutput: AnyObject {
  /// Closes Authorization module
  func closeAuthorizationModule()
}

// MARK: - AuthorizationViewRouteMap

public protocol AuthorizationViewRouteMap: AnyObject {
  /// Configures Authorization module
  func getAuthorizationModule() -> Module<AuthorizationModuleInput, AuthorizationModuleOutput>
}

// MARK: - AuthorizationUserStory

public final class AuthorizationUserStory {
  // MARK: - Properties

  let container: Container

  // MARK: - Initialisation

  init(parentContainer: Container?) {
    container = Container(parent: parentContainer)
  }
}

// MARK: - AuthorizationViewRouteMap

extension AuthorizationUserStory: AuthorizationViewRouteMap {
  public func getAuthorizationModule() -> Module<AuthorizationModuleInput, AuthorizationModuleOutput> {
    let interactor = AuthorizationInteractor()

    let presenter = AuthorizationPresenter()
    let router = AuthorizationRouter()
    let collectionFlow = AuthorizationCollectionFlowLayout()
    let view = AuthorizationViewController()

    interactor.presenter = presenter

    presenter.display = collectionFlow
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view

    router.carrier = view

    collectionFlow.dataFeeder = presenter

    view.collectionItemCalculator = collectionFlow
    view.presenter = presenter

    return Module<AuthorizationModuleInput, AuthorizationModuleOutput>(
      view: view,
      input: presenter,
      setModuleOutput: {
        presenter.output = $0
      }
    )
  }
}
