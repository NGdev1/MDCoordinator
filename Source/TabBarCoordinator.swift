//
//  TabBarCoordinator.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 05.02.2020.
//  Copyright © 2020 MD. All rights reserved.
//

import UIKit

open class TabBarCoordinator<RouteType: Route>: Router<RouteType> {
    // MARK: Properties

    public var rootViewController: UITabBarController

    // MARK: Init

    public init(
        rootViewController: UITabBarController = UITabBarController(),
        initialRoute: RouteType? = nil
    ) {
        self.rootViewController = rootViewController
        super.init(viewController: rootViewController)
        if let initialRoute = initialRoute {
            trigger(initialRoute)
        }
    }

    open override func performTransition(
        of type: TransitionType,
        animated: Bool = true
    ) {
        switch type {
        case let .present(presentable):
            viewController.present(
                presentable.viewController,
                animated: animated
            )
        case let .presentFullScreen(presentable):
            presentable.viewController.modalPresentationStyle = .fullScreen
            viewController.present(
                presentable.viewController,
                animated: animated
            )
        case let .set(presentables):
            rootViewController.viewControllers = presentables.map { (presentable: Presentable) -> UIViewController in
                presentable.viewController
            }
        case let .select(index):
            rootViewController.selectedIndex = index
        case .push:
            fatalError("UITabBarController can't push view controllers.")
        case .none:
            return
        }
    }
}
