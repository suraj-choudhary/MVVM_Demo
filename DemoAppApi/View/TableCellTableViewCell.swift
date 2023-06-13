//
//  TableCellTableViewCell.swift
//  DemoAppApi
//
//  Created by suraj kumar on 11/06/23.
//

import UIKit

struct TableCellViewModel {
    var image: String
    var name: String
}

class TableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imageviewPr: UIImageView!
    @IBOutlet weak var pNameLabel: UILabel!
    static let identifier = "TableCellTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
