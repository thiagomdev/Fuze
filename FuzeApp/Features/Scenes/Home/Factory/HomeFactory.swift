//
//  HomeFactory.swift
//  FuzeApp
//
//  Created by Thiago Monteiro on 28/08/24.
//

import UIKit

enum HomeFactory {
    static func make() -> UIViewController {
        let service = Service(session: .shared)
        let viewModel = HomeViewModel(service: service)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
