//
//  AppCoordinator.swift
//  Weather
//
//  Created by Zuhair Hussain on 09/12/2021.
//

import UIKit


protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    
    private weak var window: UIWindow?
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let services = DIContainer.shared.createWeatherServices()
        
        let viewModel = HomeViewModel(services: services)
        let controller = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
