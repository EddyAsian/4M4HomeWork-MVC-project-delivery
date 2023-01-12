import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    public static let reusedID = String(describing: OrderCollectionViewCell.self)
    @IBOutlet private weak var orderCustomView: UIView!
    @IBOutlet private weak var categoryImage: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func display(item: OrderModel, selected: OrderModel) {
        categoryImage.image = UIImage(named: item.image)
        categoryLabel.text = item.name
    }
    
    @IBInspectable
    private var cornerRadius: CGFloat {
        get { self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    private var contentColor: UIColor {
        get { self.backgroundColor ?? .clear }
        set { self.backgroundColor = newValue }
    }
}
