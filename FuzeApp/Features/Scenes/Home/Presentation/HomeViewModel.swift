import Foundation

protocol HomeViewModeling {
    func fetchData(callback: @escaping (Result<[Matches], Error>) -> Void)
}

final class HomeViewModel {
    private let service: ServicingProtocol
    
    init(service: ServicingProtocol) {
        self.service = service
    }
}

extension HomeViewModel: HomeViewModeling {
    func fetchData(callback: @escaping (Result<[Matches], any Error>) -> Void) {
        service.fetchData { result in
            switch result {
            case let .success(matches):
                callback(.success(matches))
            case let .failure(failure):
                callback(.failure(failure))
            }
        }
    }
}
