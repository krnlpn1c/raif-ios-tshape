//
//  AuthAssembly.swift
//  Test
//
//  Created CHEMIA Georgy on 31.08.2021.
//

import Swinject

// MARK: - AuthAssembly

public final class AuthAssembly {
  // MARK: - Initialisation

  public init() {}
}

// MARK: - Assembly

extension AuthAssembly: Assembly {
  public func assemble(container: Container) {
    container.register(AuthViewRouteMap.self) { resolver in
      AuthUserStory(parentContainer: resolver as? Container)
    }
  }
}
