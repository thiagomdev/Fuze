import UIKit

final class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewConfig {
    func buildViews() {
        
    }
    
    func pin() {
        
    }
    
    func configUI() {
        backgroundColor = .colorApp
    }
}
