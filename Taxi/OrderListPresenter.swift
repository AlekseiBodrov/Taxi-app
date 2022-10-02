//
//  OrderListPresenter.swift
//  Taxi
//
//  Created by Алексей Бодров on 02.10.2022.
//

import Foundation

class OrderListPresenter: OrderListViewOutputProtocol {
  // MARK: -  Properties
  unowned let view: OrderListViewInputProtocol
  var interactor: OrderListInteractorInputProtocol!
  var router: OrderListRouterInputProtocol!

  // MARK: - Initialization
  required init(view: OrderListViewInputProtocol) {
    self.view = view
  }
  func viewDidLoad() {
    interactor.fetchOrders()
  }

  // MARK: - OrderListViewOutputProtocol
  func didTapCell(at indexPath: IndexPath) {
    interactor.getOrder(at: indexPath)
  }
}

// MARK: - OrderListInteractorOutputProtocol
extension OrderListPresenter: OrderListInteractorOutputProtocol {
  func ordersDidReceive(_ orders: Orders) {
    let section = OrderSectionViewModel()
    orders.forEach {
      section.rows.append(OrderListCellViewModel(order: $0))
    }
    view.reloadData(for: section)
  }
  func didReceiveError(with error: String) {
    view.showAlert(with: error)
  }
  func orderDidReceive(_ order: Order) {
    router.openOrderDetailsViewController(with: order)
  }
}

