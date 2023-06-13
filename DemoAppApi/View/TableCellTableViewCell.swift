//
//  TableCellTableViewCell.swift
//  DemoAppApi
//
//  Created by suraj kumar on 11/06/23.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    static let identifier = "TableCellTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                print("Error loading image: \(error)")
                completion(nil)
                return
            }
            
            if let imageData = data, let image = UIImage(data: imageData) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }

    var productViewModel: ProductTableCellViewModel? {
        didSet {
    
            getImage(url: productViewModel?.productImage ?? "") { img in
                DispatchQueue.main.async {
                    self.productImageView.image = img
                }
               
            }
           
            productNameLbl.text = productViewModel?.productName
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        productImageView.image = nil
        productNameLbl.text = nil
    }

}



