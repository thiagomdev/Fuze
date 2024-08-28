import UIKit

final class HomeView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .container
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
        backgroundColor = .colorApp
    }
}
