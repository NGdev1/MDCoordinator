//
//  TransitionType.swift
//  MDCoordinator
//
//  Created by Михаил Андреичев on 05.02.2020.
//

public enum TransitionType {
    case push(_ presentable: Presentable)
    case present(_ presentable: Presentable)
    case presentFullScreen(_ presentable: Presentable)
    case set(_ presentables: [Presentable])
    case select(index: Int)
    case none
}
