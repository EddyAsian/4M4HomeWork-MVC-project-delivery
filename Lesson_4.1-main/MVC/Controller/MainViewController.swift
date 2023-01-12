import UIKit

class MainViewController: UIViewController {
    @IBOutlet private weak var serviceCollectionView: UICollectionView!
    @IBOutlet private weak var orderCollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
    private var serivceDataCellIndex: IndexPath? = nil
    
    private let serviceData: [ServiceDataModel] = [
        .init(image: "bicycle", name: "Delivery", isSelected: false),
        .init(image: "box.truck", name: "PickUp", isSelected: false),
        .init(image: "sailboat", name: "Catering", isSelected: false),
        .init(image: "airplane", name: "Delivery", isSelected: false),
        .init(image: "scooter", name: "Fast", isSelected: false),
        .init(image: "ferry", name: "Boat", isSelected: false),
        .init(image: "fork.knife", name: "Kitchen", isSelected: false),
        .init(image: "rectangle.roundedtop", name: "PickUp", isSelected: false),
        .init(image: "car", name: "Catering", isSelected: false)
    ]
    
    private let orderData: [OrderModel] = [
        .init(image: "burger3", name: "Takeaways", isSelected: true),
        .init(image: "products", name: "Grocery", isSelected: true),
        .init(image: "convenience", name: "Convenience", isSelected: true),
        .init(image: "pharmacy", name: "Pharmacy", isSelected: true)
    ]
    
    private let productData: [ProductModel] = [
        .init(openRestraunts: "58 stores Open", productImage: "burger3", promotion: "Spend 25$, save 5$", productName: "Burger Craze", timeSchedule: "• OPEN", rating: "⭐️4.6 (601)", category: "American • Burgers", delivery: "Delivery: FREE •", price: "Minimum: 10$", deliveryTime: "15 - 20 min", distance: "🛵1.5 km away", isSelected: true),
        .init(openRestraunts: "25 stores Open", productImage: "pizza1", promotion: "Spend 25$, save 5$", productName: "Pizza Margarita", timeSchedule: "• OPEN", rating: "⭐️4.6 (558)", category: "Italian • Pizza", delivery: "Delivery: FREE •", price: "Minimum: 10$", deliveryTime: "10 - 15 min", distance: "🛵1.2 km away", isSelected: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureServiceCV()
    }
    
    private func configureServiceCV() {
        serviceCollectionView.dataSource = self
        serviceCollectionView.delegate = self
        serviceCollectionView.register(
            UINib(nibName: String(describing: ServiceCollectionViewCell.self), bundle: nil),
            forCellWithReuseIdentifier: ServiceCollectionViewCell.reusedID
        )
        
        orderCollectionView.dataSource = self
        orderCollectionView.delegate = self
        orderCollectionView.register(
            UINib(nibName: String(describing: OrderCollectionViewCell.self), bundle: nil),
            forCellWithReuseIdentifier: OrderCollectionViewCell.reusedID
        )
        
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(
            UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: ProductTableViewCell.reusedID
        )
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == serviceCollectionView {
            return serviceData.count
        } else {
            return orderData.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView == serviceCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ServiceCollectionViewCell.reusedID,
                for: indexPath
            ) as? ServiceCollectionViewCell else {
                fatalError()
            }
            
            let service = serviceData[indexPath.item]
            cell.display(item: service, selected: service)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OrderCollectionViewCell.reusedID,
                for: indexPath
            ) as? OrderCollectionViewCell else {
                fatalError()
            }
            
            let category = orderData[indexPath.item]
            cell.display(item: category, selected: category)
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if collectionView == serviceCollectionView {
            return CGSize(width: 105, height: 40)
        } else {
            return CGSize(width: 100, height: 115)
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            if collectionView == serviceCollectionView {
                guard let cell = collectionView.cellForItem(at: indexPath) else {
                    return
                }
                
                if indexPath != serivceDataCellIndex && serivceDataCellIndex != nil {
                    guard let cell = collectionView.cellForItem(at: serivceDataCellIndex!) else {
                        return
                    }
                    
                    cell.backgroundColor = .white
                }
                
                cell.backgroundColor = UIColor(
                    red: 0.99, green: 1.00, blue: 0.76, alpha: 1.00
                )
                serivceDataCellIndex = indexPath
            }
        }
}

extension MainViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return productData.count
    }
    
    func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.reusedID,
            for: indexPath) as? ProductTableViewCell else {
            fatalError()
        }
        
        cell.delegate = self
        let product = productData[indexPath.row]
        cell.display(item: product, selected: product)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}

extension MainViewController: ProductCellImageDelegate {
    func openNewImageViewController(_ item: ProductModel) {
        let imageVC = storyboard?.instantiateViewController(
            withIdentifier: "productimagevc"
        ) as! ProductImageViewController
        imageVC.imageAtOpeningVC = UIImage(named: item.productImage)!
        navigationController?.pushViewController(imageVC, animated: true)
    }
}

