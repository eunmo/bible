//
//  Book.swift
//  Bible
//
//  Created by Eunmo Yang on 1/17/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import Foundation

class Book {
    
    // MARK: Properties
    let name: String
    let abbr: String
    let chapters: Int
    var index = 0
    
    init(name: String, abbr: String, chapters: Int) {
        self.name = name
        self.abbr = abbr
        self.chapters = chapters
    }
}