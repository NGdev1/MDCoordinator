//
//  RoutableViewController.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 02.04.2020.
//

import Foundation

open class RoutableViewController<RouteType: Route>: UIViewController {
    public var router: Router<RouteType>?
}
