//
//  Bible.swift
//  Bible
//
//  Created by Eunmo Yang on 1/17/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import Foundation

class Bible {
    
    // MARK: Properties
    
    var books: [Book]
    var languages: [Language]
    var selectedIndexes: [Int]
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("languages")
    
    // MARK: Notification Key
    
    static let notificationKey = "netShuffleNotificationKey"
    
    init() {
        books = [Book]()
        books.append(Book(name: "창세기", abbr: "창", chapters: 50))
        books.append(Book(name: "출애굽기", abbr: "출", chapters: 40))
        books.append(Book(name: "레위기", abbr: "레", chapters: 27))
        books.append(Book(name: "민수기", abbr: "민", chapters: 36))
        books.append(Book(name: "신명기", abbr: "신", chapters: 34))
        books.append(Book(name: "여호수아", abbr: "수", chapters: 24))
        books.append(Book(name: "사사기", abbr: "삿", chapters: 21))
        books.append(Book(name: "룻기", abbr: "룻", chapters: 4))
        books.append(Book(name: "사무엘상", abbr: "삼상", chapters: 31))
        books.append(Book(name: "사무엘하", abbr: "삼하", chapters: 24))
        books.append(Book(name: "열왕기상", abbr: "왕상", chapters: 22))
        books.append(Book(name: "열왕기하", abbr: "왕하", chapters: 25))
        books.append(Book(name: "역대상", abbr: "대상", chapters: 29))
        books.append(Book(name: "역대하", abbr: "대하", chapters: 36))
        books.append(Book(name: "에스라", abbr: "스", chapters: 10))
        books.append(Book(name: "느혜미야", abbr: "느", chapters: 13))
        books.append(Book(name: "에스더", abbr: "에", chapters: 10))
        books.append(Book(name: "욥기", abbr: "욥", chapters: 42))
        books.append(Book(name: "시편", abbr: "시", chapters: 150))
        books.append(Book(name: "잠언", abbr: "잠", chapters: 31))
        books.append(Book(name: "전도서", abbr: "전", chapters: 12))
        books.append(Book(name: "아가", abbr: "아", chapters: 8))
        books.append(Book(name: "이사야", abbr: "사", chapters: 66))
        books.append(Book(name: "예레미야", abbr: "렘", chapters: 52))
        books.append(Book(name: "예레미야애가", abbr: "애", chapters: 5))
        books.append(Book(name: "에스겔", abbr: "겔", chapters: 48))
        books.append(Book(name: "다니엘", abbr: "단", chapters: 12))
        books.append(Book(name: "호세아", abbr: "호", chapters: 14))
        books.append(Book(name: "요엘", abbr: "요", chapters: 3))
        books.append(Book(name: "아모스", abbr: "암", chapters: 9))
        books.append(Book(name: "오바댜", abbr: "옵", chapters: 1))
        books.append(Book(name: "요나", abbr: "욘", chapters: 4))
        books.append(Book(name: "미가", abbr: "미", chapters: 7))
        books.append(Book(name: "나훔", abbr: "나", chapters: 3))
        books.append(Book(name: "하박국", abbr: "합", chapters: 3))
        books.append(Book(name: "스바냐", abbr: "습", chapters: 3))
        books.append(Book(name: "학개", abbr: "학", chapters: 2))
        books.append(Book(name: "스가랴", abbr: "슥", chapters: 14))
        books.append(Book(name: "말라기", abbr: "말", chapters: 4))
        books.append(Book(name: "마태복음", abbr: "마", chapters: 28))
        books.append(Book(name: "마가복음", abbr: "막", chapters: 16))
        books.append(Book(name: "누가복음", abbr: "눅", chapters: 24))
        books.append(Book(name: "요한복음", abbr: "요", chapters: 21))
        books.append(Book(name: "사도행전", abbr: "행", chapters: 28))
        books.append(Book(name: "로마서", abbr: "롬", chapters: 16))
        books.append(Book(name: "고린도전서", abbr: "고전", chapters: 16))
        books.append(Book(name: "고린도후서", abbr: "고후", chapters: 13))
        books.append(Book(name: "갈라디아서", abbr: "갈", chapters: 6))
        books.append(Book(name: "에베소서", abbr: "엡", chapters: 6))
        books.append(Book(name: "빌립보서", abbr: "빌", chapters: 4))
        books.append(Book(name: "골로새서", abbr: "골", chapters: 4))
        books.append(Book(name: "데살로니가전서", abbr: "살전", chapters: 5))
        books.append(Book(name: "데살로니가후서", abbr: "살후", chapters: 3))
        books.append(Book(name: "디모데전서", abbr: "딤전", chapters: 6))
        books.append(Book(name: "디모데후서", abbr: "딤후", chapters: 4))
        books.append(Book(name: "디도서", abbr: "딛", chapters: 3))
        books.append(Book(name: "빌레몬서", abbr: "몬", chapters: 1))
        books.append(Book(name: "히브리서", abbr: "히", chapters: 13))
        books.append(Book(name: "야고보서", abbr: "약", chapters: 5))
        books.append(Book(name: "베드로전서", abbr: "벧전", chapters: 5))
        books.append(Book(name: "베드로후서", abbr: "벧후", chapters: 3))
        books.append(Book(name: "요한1서", abbr: "요1", chapters: 5))
        books.append(Book(name: "요한2서", abbr: "요2", chapters: 1))
        books.append(Book(name: "요한3서", abbr: "요3", chapters: 1))
        books.append(Book(name: "유다서", abbr: "유", chapters: 1))
        books.append(Book(name: "요한계시록", abbr: "계", chapters: 22))
        
        for (index, book) in books.enumerated() {
            book.index = index
        }
        
        languages = [Language]()
        
        languages.append(Language(name: "🇰🇷 개역개정", abbr: "K"))
        languages.append(Language(name: "🇰🇷 우리말성경", abbr: "K2"))
        languages.append(Language(name: "🇰🇷 쉬운성경", abbr: "K3"))
        languages.append(Language(name: "🇺🇸 NIV", abbr: "E"))
        languages.append(Language(name: "🇯🇵 新改訳2017", abbr: "J"))
        languages.append(Language(name: "🇯🇵 新改訳第3版", abbr: "J3"))
        languages.append(Language(name: "🇫🇷 Louis Segond", abbr: "F"))
        languages.append(Language(name: "🇪🇸 NVI", abbr: "S"))
        
        
        selectedIndexes = [1, 0]
        load()
    }
    
    func indexPathToIndex(_ indexPath: IndexPath) -> Int {
        return (indexPath as NSIndexPath).section == 0 ? (indexPath as NSIndexPath).row : (indexPath as NSIndexPath).row + 39
    }
    
    func getAbbr(_ indexPath: IndexPath) -> String {
        let index = indexPathToIndex(indexPath)
        var abbr = ""
        if index < books.count {
            abbr = books[index].abbr
        }
        return abbr
    }
    
    func getBook(_ indexPath: IndexPath) -> Book {
        let index = indexPathToIndex(indexPath)
        return books[index]
    }
    
    func getVersesInternal(index: Int, book: Int, chapter: Int) -> [String] {
        let file = "data/\(languages[selectedIndexes[index]].abbr).\(book + 1).\(chapter)"
        if let path = Bundle.main.path(forResource: file, ofType: ""), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            return dataToArray(data)
        }
        
        return [String]()
        
    }
    
    func getVerses(_ book: Int, chapter: Int) -> [String] {
        return getVersesInternal(index: 0, book: book, chapter: chapter)
    }
    
    func getSubVerses(_ book: Int, chapter: Int) -> [String] {
        return getVersesInternal(index: 1, book: book, chapter: chapter)
    }
    
    func getMainLanguage() -> String {
        return languages[selectedIndexes[0]].name
    }
    
    func getSubLanguage() -> String {
        return languages[selectedIndexes[1]].name
    }
    
    func isSelected(section: Int, index: Int) -> Bool {
        return selectedIndexes[section] == index
    }
    
    func changeLanguage(section: Int, index: Int) {
        selectedIndexes[section] = index
        save()
    }
    
    func dataToArray(_ data: Data) -> [String] {
        var verses = [String]()
        if let jsonData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSArray {
            for verse in jsonData as! [String] {
                verses.append(verse)
            }
        }
        return verses
    }
    
    // MARK: NSCoding
    
    func save() {
        NSKeyedArchiver.archiveRootObject(selectedIndexes, toFile: Bible.ArchiveURL.path)
        NotificationCenter.default.post(name: Notification.Name(rawValue: Bible.notificationKey), object: self)
    }
    
    func load() {
        let savedIndexes = NSKeyedUnarchiver.unarchiveObject(withFile: Bible.ArchiveURL.path) as? [Int]
        
        if savedIndexes != nil {
            selectedIndexes = savedIndexes!
        }
        
        /* for debugging
        for i in 0..<languages.count {
            for (j, book) in books.enumerated() {
                for k in 1...book.chapters {
                    let file = "data/\(languages[i].abbr).\(j + 1).\(k)"
                    print(file)
                    let path = Bundle.main.path(forResource: file, ofType: "")
                    let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
                    let jsonData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSArray
                }
            }
        }
 */
    }
}
