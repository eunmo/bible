//
//  VersePortraitTableViewCell.swift
//  Bible
//
//  Created by Eunmo Yang on 2019/05/05.
//  Copyright © 2019 Eunmo Yang. All rights reserved.
//

import UIKit

class VersePortraitTableViewCell: UITableViewCell {

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var transLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
