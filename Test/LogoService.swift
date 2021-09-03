//
// Created by CHEMIA Georgy on 03.09.2021.
//

import Raft

class LogoService {
//        let baseUrl = "https://www.raiffeisen.ru"
//        let logoPath = "/common/new/images/logo-raif.svg"
    private let baseUrl = "https://jsonplaceholder.typicode.com"
    private let logoPath = "/posts"
    private let marker = Marker("logo")
    private let raft: Raft.Service = Raft.Service()

    func fetch(callback: @escaping (Result<AnyObject, LogoError>) -> Void) {

        raft.register(configuration: LogoConfiguration(), queue: OperationQueue(), for: marker)
        raft.trustValidator.add(evaluator: IgnoringTrustEvaluator(), for: "raiffeisen.ru")
        raft.trustValidator.add(evaluator: IgnoringTrustEvaluator(), for: "jsonplaceholder.typicode.com")

        let task: Task<AnyObject, LogoError>? = raft.task(marker: marker)
        task?.request.baseURL = URL(string: baseUrl)
        task?.request.path = logoPath
        task?.perform { (result) in
            DispatchQueue.main.async {
                callback(result)
            }
        }
    }
}

public final class LogoConfiguration: Configurable {
    public func apply(to request: inout Request) {
        request.trust = TrustValidator(shouldIgnoreAll: true)
        request.trust.add(evaluator: IgnoringTrustEvaluator(), for: "raiffeisen.ru")
        request.trust.add(evaluator: IgnoringTrustEvaluator(), for: "jsonplaceholder.typicode.com")
    }
}

public enum LogoError: Swift.Error {
    case failed
}

extension LogoError: RaftErrorInitializable {
    public init(_ raftError: Raft.Error) {
        self = .failed
    }
}
