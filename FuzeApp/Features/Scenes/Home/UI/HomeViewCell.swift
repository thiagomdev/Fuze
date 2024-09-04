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
    
    private lazy var inLiveView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var teamStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 80
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var teamImageOne: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var vsLabel: UILabel = {
        let label = UILabel()
        label.text = "vs"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamImageTwo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var teamOneLabel: UILabel = {
        let label = UILabel()
//        label.text = "Time 1"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var teamTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "Time 2"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var leagueAndSerieImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewCell {
    func setupCell(from dataObject: Matches) {
        teamOneLabel.text = dataObject.name
    }
}

extension HomeViewCell: ViewConfig {
    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(inLiveView)
        stackView.addArrangedSubview(teamImageOne)
        stackView.addArrangedSubview(vsLabel)
        stackView.addArrangedSubview(teamImageTwo)
        containerView.addSubview(stackView)
        containerView.addSubview(separatorView)
        containerView.addSubview(leagueAndSerieImage)
        
        teamStackView.addArrangedSubview(teamOneLabel)
        teamStackView.addArrangedSubview(teamTwoLabel)
        
        containerView.addSubview(teamStackView)
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
                multiplier: 1.5),
            
            inLiveView.topAnchor.constraint(equalTo: containerView.topAnchor),
            inLiveView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            inLiveView.heightAnchor.constraint(equalToConstant: 28),
            inLiveView.widthAnchor.constraint(equalToConstant: 64),
            
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            teamStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            teamStackView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10),
                        
            teamImageOne.heightAnchor.constraint(equalToConstant: 70),
            teamImageOne.widthAnchor.constraint(equalToConstant: 70),
            
            teamImageTwo.heightAnchor.constraint(equalToConstant: 70),
            teamImageTwo.widthAnchor.constraint(equalToConstant: 70),
            
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            leagueAndSerieImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            leagueAndSerieImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            leagueAndSerieImage.heightAnchor.constraint(equalToConstant: 20),
            leagueAndSerieImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configUI() {
        selectionStyle = .none
        backgroundColor = .colorApp
    }
}
