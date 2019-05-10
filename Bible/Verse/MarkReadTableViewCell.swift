//
//  MarkReadTableViewCell.swift
//  Bible
//
//  Created by Eunmo Yang on 2019/05/05.
//  Copyright © 2019 Eunmo Yang. All rights reserved.
//

import UIKit

class MarkReadTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    var chapter: Chapter? {
        didSet {
            update()
        }
    }
    
    func update() {
        if let chapter = chapter {
            if chapter.isMarkedRead() {
                button.setTitle("Unmark as read", for: .normal)
            } else {
                button.setTitle("Mark as read", for: .normal)
            }
        }
    }
    
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
    
    @IBAction func onClick(_ sender: UIButton) {
        chapter?.toggle()
        update()
    }
}
