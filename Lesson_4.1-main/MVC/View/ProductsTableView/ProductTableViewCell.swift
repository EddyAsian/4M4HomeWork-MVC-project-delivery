import UIKit

protocol ProductCellImageDelegate: AnyObject {
    func openNewImageViewController(_ item: ProductModel)
}

class ProductTableViewCell: UITableViewCell {
    public static let reusedID = String(describing: ProductTableViewCell.self)
    @IBOutlet private weak var openRestrauntsLabel: UILabel!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var producImageView: UIImageView!
    @IBOutlet private weak var promotionLabel: UILabel!
    @IBOutlet private weak var timeScheduleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var deliveryLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var deliveryTimeLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var thirdCustomView: UIView!
    
    weak var delegate: ProductCellImageDelegate?
    private var product: ProductModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        foodImgGestureRecognizer()
    }
    
    func display(item: ProductModel, selected: ProductModel) {
        product = item
        openRestrauntsLabel.text = item.openRestraunts
        productNameLabel.text = item.productName
        producImageView.image = UIImage(named: item.productImage)
        promotionLabel.text = item.promotion
        timeScheduleLabel.text = item.timeSchedule
        ratingLabel.text = item.rating
        categoryLabel.text = item.category
        deliveryLabel.text = item.delivery
        priceLabel.text = item.price
        deliveryTimeLabel.text = item.deliveryTime
        distanceLabel.text = item.distance
    }
    
    func foodImgGestureRecognizer() {
        let productImageTap = UITapGestureRecognizer(
            target: self, action: #selector(tapOnProductImage)
        )
        producImageView.isUserInteractionEnabled = true
        producImageView.addGestureRecognizer(productImageTap)
    }
    
    @objc
    private func tapOnProductImage() {
        guard let product = product else {
            return
        }
        delegate?.openNewImageViewController(product)
    }
}


