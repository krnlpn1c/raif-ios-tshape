//
//  AuthUserStory.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import RFModule
import Swinject

// MARK: - AuthModuleInput

public protocol AuthModuleInput: AnyObject {}

// MARK: - AuthModuleOutput

public protocol AuthModuleOutput: AnyObject {
  /// Closes Auth module
  func closeAuthModule()
}

// MARK: - AuthViewRouteMap

public protocol AuthViewRouteMap: AnyObject {
  /// Configures Auth module
  func getAuthModule() -> Module<AuthModuleInput, AuthModuleOutput>
}

// MARK: - AuthUserStory

public final class AuthUserStory {
  // MARK: - Properties

  let container: Container

  // MARK: - Initialisation

  init(parentContainer: Container?) {
    container = Container(parent: parentContainer)
  }
}

// MARK: - AuthViewRouteMap

extension AuthUserStory: AuthViewRouteMap {
  public func getAuthModule() -> Module<AuthModuleInput, AuthModuleOutput> {
    let interactor = AuthInteractor()

    let presenter = AuthPresenter()
    let router = AuthRouter()
    let tableFlow = AuthTableFlowLayout()
    let view = AuthViewController()

    interactor.presenter = presenter

    presenter.display = tableFlow
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view

    router.carrier = view

    tableFlow.dataFeeder = presenter

    view.tableItemCalculator = tableFlow
    view.presenter = presenter

    return Module<AuthModuleInput, AuthModuleOutput>(
      view: view,
      input: presenter,
      setModuleOutput: {
        presenter.output = $0
      }
    )
  }
}
