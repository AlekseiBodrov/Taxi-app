//
//  OrderListRouter.swift
//  Taxi
//
//  Created by Алексей Бодров on 02.10.2022.
//

import Foundation

protocol OrderListRouterInputProtocol: AnyObject {
  init(viewController: OrderListViewController)
  func openOrderDetailsViewController(with order: Order)
}

class OrderListRouter: OrderListRouterInputProtocol {
  unowned let viewController: OrderListViewController
  required init(viewController: OrderListViewController) {
    self.viewController = viewController
  }
  func openOrderDetailsViewController(with order: Order) {
    viewController.prepareDetailsVC(with: order)
  }
}
