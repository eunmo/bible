//
//  Chapter.swift
//  Bible
//
//  Created by Eunmo Yang on 2019/05/05.
//  Copyright © 2019 Eunmo Yang. All rights reserved.
//

import Foundation

class Chapter {
    
    // MARK: Properties
    let bible: Bible
    let book: Int
    let chapter: Int
    let index: Int
    
    init(bible: Bible, book: Int, chapter: Int) {
        self.bible = bible
        self.book = book
        self.chapter = chapter
        self.index = bible.getChapterIndex(book: book, chapter: chapter)
    }
    
    func isMarkedRead() -> Bool {
        return bible.isChapterMarkedRead(self.index)
    }
    
    func getString() -> String {
        return "\(bible.books[book].name) \(chapter)장"
    }
    
    func toggle() {
        bible.toggleChapter(self)
    }
}
