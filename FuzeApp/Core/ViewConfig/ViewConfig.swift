import Foundation

protocol ViewConfig {
    func buildViews()
    func pin()
    func configUI()
    func setup()
}

extension ViewConfig {
    func setup() {
        buildViews()
        pin()
        configUI()
    }
}
