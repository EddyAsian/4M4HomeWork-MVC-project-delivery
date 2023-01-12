
import UIKit

struct ProductModel: Equatable {
    var id = UUID()
    let openRestraunts: String
    let productImage: String
    let promotion: String
    let productName: String
    let timeSchedule: String
    let rating: String
    let category: String
    let delivery: String
    let price: String
    let deliveryTime: String
    let distance: String
    var isSelected: Bool
    
    static func ==(lhs: ProductModel, rhs: ProductModel) -> Bool {
        lhs.id == rhs.id
    }
}



