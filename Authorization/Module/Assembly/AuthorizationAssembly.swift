//
//  AuthorizationAssembly.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Swinject

// MARK: - AuthorizationAssembly

public final class AuthorizationAssembly {
  // MARK: - Initialisation

  public init() {}
}

// MARK: - Assembly

extension AuthorizationAssembly: Assembly {
  public func assemble(container: Container) {
    container.register(AuthorizationViewRouteMap.self) { resolver in
      AuthorizationUserStory(parentContainer: resolver as? Container)
    }
  }
}
