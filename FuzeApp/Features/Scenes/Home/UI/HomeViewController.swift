import UIKit

final class HomeViewController: UIViewController {
    private let viewModel: HomeViewModeling
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.set(delegate: self, dataSource: self)
        return view
    }()
    
    init(viewModel: HomeViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = homeView
        
        viewModel.fetchData { result in
            switch result {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                dump(failure)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup(navigation: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeViewCell.identifier,
            for: indexPath) as? HomeViewCell {
            return cell
        }
        return UITableViewCell()
    }
}

extension HomeViewController {
    private func setup(navigation: UIViewController) {
        navigation.navigationItem.title = "Partidas"
        navigation.navigationController?.navigationBar.prefersLargeTitles = true
        navigation.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white]
        navigation.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white]
        navigation.navigationController?.navigationBar.barTintColor = .colorApp
    }
}
