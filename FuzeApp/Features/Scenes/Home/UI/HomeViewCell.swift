import UIKit

final class HomeViewCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .container
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewCell: ViewConfig {
    func buildViews() {
        contentView.addSubview(containerView)
    }
    
    func pin() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }
    
    func configUI() {
        selectionStyle = .none
        backgroundColor = .colorApp
    }
}
