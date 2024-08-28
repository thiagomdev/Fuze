import UIKit

final class HomeViewController: UIViewController {
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.set(tableView: self, and: self)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup(navigation: self)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
