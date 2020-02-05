//
//  Presentable.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 05.02.2020.
//  Copyright © 2020 MD. All rights reserved.
//

import UIKit

public protocol Presentable {
    var viewController: UIViewController { get }
}

extension UIViewController: Presentable {
    public var viewController: UIViewController {
        return self
    }
}
