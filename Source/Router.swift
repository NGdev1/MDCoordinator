//
//  Router.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 05.02.2020.
//  Copyright © 2020 MD. All rights reserved.
//

import UIKit

open class Router<RouteType: Route>: Presentable {
    // MARK: Properties

    public var viewController: UIViewController

    public var router: Router<RouteType> {
        return self
    }

    // MARK: Init

    public init(viewController: UIViewController) {
        self.viewController = viewController
    }

    // MARK: Public methods

    open func prepareTransition(for route: RouteType) -> TransitionType {
        fatalError("Please override the \(#function) method.")
    }

    public func performTransition(
        of type: TransitionType,
        animated: Bool = true
    ) {
        switch type {
        case let .present(presentable):
            viewController.present(
                presentable.viewController,
                animated: animated
            )
        case let .push(presentable):
            viewController.navigationController?.pushViewController(
                presentable.viewController,
                animated: animated
            )
        case let .presentOnRoot(presentable):
            presentable.viewController.modalPresentationStyle = .fullScreen
            viewController.present(
                presentable.viewController,
                animated: animated
            )
        case .set:
            fatalError("UINavigationController set view controllers not supported.")
        case .none:
            return
        }
    }

    public func trigger(
        _ route: RouteType
    ) {
        let type = prepareTransition(for: route)
        performTransition(of: type)
    }
}
