//
//  VerseTableViewCell.swift
//  Bible
//
//  Created by Eunmo Yang on 1/16/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import UIKit

class VerseTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var transLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
