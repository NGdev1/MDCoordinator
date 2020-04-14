//
//  NavigationCoordinator.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 05.02.2020.
//  Copyright © 2020 MD. All rights reserved.
//

import UIKit

open class NavigationCoordinator<RouteType: Route>: Router<RouteType> {
    // MARK: Properties

    public unowned var rootViewController: UINavigationController

    // MARK: Init

    public init(
        rootViewController: UINavigationController = UINavigationController(),
        initialRoute: RouteType? = nil
    ) {
        self.rootViewController = rootViewController
        super.init(viewController: rootViewController)
        if let initialRoute = initialRoute {
            router.trigger(initialRoute)
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
            let routable = presentable.viewController as? RoutableViewController<RouteType>
            routable?.router = router
        case let .presentFullScreen(presentable):
            presentable.viewController.modalPresentationStyle = .fullScreen
            viewController.present(
                presentable.viewController,
                animated: animated
            )
            let routable = presentable.viewController as? RoutableViewController<RouteType>
            routable?.router = router
        case let .push(presentable):
            rootViewController.pushViewController(
                presentable.viewController,
                animated: animated
            )
            if let routable = presentable as? RoutableViewController<RouteType> {
                routable.router = router
            }
        case .set:
            fatalError("UINavigationController set view controllers not supported.")
        case .select:
            fatalError("UINavigationController set view controllers not supported.")
        case .none:
            return
        }
    }
}
