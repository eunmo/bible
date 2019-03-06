//
//  LanguageTableViewCell.swift
//  Bible
//
//  Created by Eunmo Yang on 3/7/19.
//  Copyright © 2019 Eunmo Yang. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var primaryLangButton: UIButton!
    @IBOutlet weak var secondaryLangButton: UIButton!
    
    let blue = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    
    var bible: Bible?
    
    var index: Int? {
        didSet {
            if let i = index {
                let language = bible!.languages[i]
                langLabel.text = language.name
                
                if bible!.isSelected(section: 0, index: i) {
                    primaryLangButton.setTitleColor(blue, for: UIControlState.normal)
                } else {
                    primaryLangButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
                }
                
                if bible!.isSelected(section: 1, index: i) {
                    secondaryLangButton.setTitleColor(blue, for: UIControlState.normal)
                } else {
                    secondaryLangButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
                }
            }
        }
    }
    
    @IBAction func mainButtonPressed(_ sender: UIButton) {
        bible!.changeLanguage(section: 0, index: index!)
    }
    
    @IBAction func subButtonPressed(_ sender: Any) {
        bible!.changeLanguage(section: 1, index: index!)
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
}
