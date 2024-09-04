import Foundation

protocol HomeViewModeling {
    func fetchData(callback: @escaping (Result<[Matches], Error>) -> Void)
    var mathes: [Matches] { get set }
}

final class HomeViewModel {
    private let service: ServicingProtocol
    private var dataStore = [Matches]()
    
    init(service: ServicingProtocol) {
        self.service = service
    }
}

extension HomeViewModel: HomeViewModeling {
    func fetchData(callback: @escaping (Result<[Matches], any Error>) -> Void) {
        service.fetchData { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(matches):
                    callback(.success(matches))
                case let .failure(failure):
                    callback(.failure(failure))
                }
            }
        }
    }
    
    var mathes: [Matches] {
        get { dataStore }
        set { dataStore = newValue }
    }
}
