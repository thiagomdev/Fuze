import UIKit

final class HomeView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .colorApp
        tableView.separatorInset = .init(top: 0, left: 27, bottom: 0, right: 27)
        tableView.separatorStyle = .none
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    func set(
        tableView delegate: UITableViewDelegate,
        and dataSource: UITableViewDataSource) {
            
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}

extension HomeView: ViewConfig {
    func buildViews() {
        addSubview(tableView)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configUI() {
        backgroundColor = .container
    }
}
