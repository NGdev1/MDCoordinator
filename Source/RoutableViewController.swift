//
//  RoutableViewController.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 02.04.2020.
//

import UIKit

open class RoutableViewController<RouteType: Route>: UIViewController {
    public var router: Router<RouteType>?
}
