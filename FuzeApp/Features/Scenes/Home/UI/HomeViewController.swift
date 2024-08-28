import UIKit

final class HomeViewController: UIViewController {
    private lazy var homeView: HomeView = {
        let view = HomeView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
}
