import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    public static let reusedID = String(describing: ServiceCollectionViewCell.self)
    @IBOutlet private weak var serviceCustomView: UIView!
    @IBOutlet private weak var serviceLabel: UILabel!
    @IBOutlet private weak var serviceImageView: UIImageView!
    
    func display(item: ServiceDataModel, selected: ServiceDataModel) {
        serviceLabel.textColor = isSelected ? UIColor.white : UIColor.green
        serviceLabel.text = item.name
        serviceImageView.image = UIImage(systemName: item.image)
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
    
    @IBInspectable
    private var borderWidth: CGFloat {
        get { self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable
    private var borderColor: CGColor {
        get { self.layer.borderColor ?? UIColor.clear.cgColor }
        set { self.layer.borderColor = newValue }
    }
}
