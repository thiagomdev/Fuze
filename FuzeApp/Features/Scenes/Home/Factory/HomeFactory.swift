import UIKit

enum HomeFactory {
    static func make() -> UIViewController {
        let service = Service(session: .shared)
        let viewModel = HomeViewModel(service: service)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
