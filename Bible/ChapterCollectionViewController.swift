//
//  ChapterCollectionViewController.swift
//  Bible
//
//  Created by Eunmo Yang on 1/16/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import UIKit

class ChapterCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    
    var bible: Bible?
    var book: Book?
    var offset = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        NotificationCenter.default.addObserver(self, selector: #selector(ChapterCollectionViewController.receiveNotification), name: NSNotification.Name(rawValue: Bible.notificationKey), object: nil)

        // Do any additional setup after loading the view.
        updateUI()
        
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .always
        }
        
        if let bible = bible, let book = book {
            offset = bible.getChapterIndex(book: book.index, chapter: 1)
        }
    }
    
    func updateUI() {
        title = book!.name
    }
    
    @objc func receiveNotification() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.collectionView?.reloadData()
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return book!.chapters
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChapterCollectionViewCell", for: indexPath) as! ChapterCollectionViewCell
    
        // Configure the cell
        cell.label.text = "\((indexPath as NSIndexPath).row + 1)"
        if (bible?.isChapterMarkedRead(offset + indexPath.row))! {
            cell.backgroundColor = UIColor.black
            cell.label.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.white
            cell.label.textColor = UIColor.black
        }
    
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Verses":
                if let vc = segue.destination as? VerseTableViewController {
                    let indexPath = collectionView?.indexPathsForSelectedItems![0]
                    vc.bible = bible
                    vc.book = book?.index
                    vc.chapter = (indexPath! as NSIndexPath).row + 1
                }
            default: break
            }
        }
    }

}
