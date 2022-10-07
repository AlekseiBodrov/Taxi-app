
import Foundation

protocol OrderListConfiguratorInputProtocol {
  func configure(with view: OrderListViewController)
}

class OrderListConfigurator: OrderListConfiguratorInputProtocol {
  func configure(with view: OrderListViewController) {
    let presenter = OrderListPresenter(view: view)
    let interactor = OrderListInteractor(presenter: presenter)
    let router = OrderListRouter(viewController: view)
    view.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
  }
}

