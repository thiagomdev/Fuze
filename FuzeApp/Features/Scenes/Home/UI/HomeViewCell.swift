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
            containerView.topAnchor.constraint(
                equalToSystemSpacingBelow: contentView.topAnchor,
                multiplier: 1.5),
            
            containerView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: contentView.leadingAnchor,
                multiplier: 3),
            
            contentView.trailingAnchor.constraint(
                equalToSystemSpacingAfter: containerView.trailingAnchor,
                multiplier: 3),
            
            contentView.bottomAnchor.constraint(
                equalToSystemSpacingBelow: containerView.bottomAnchor,
                multiplier: 1.5)
        ])
    }
    
    func configUI() {
        selectionStyle = .none
        backgroundColor = .colorApp
    }
}
