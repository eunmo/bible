//
//  VerseTableViewController.swift
//  Bible
//
//  Created by Eunmo Yang on 1/16/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import UIKit

class VerseTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var bible: Bible?
    var book: Int?
    var chapter: Int?
    var showBookTitle = false
    
    var verses = [String] ()
    var subVerses = [String]()
    
    var selectedIndex: IndexPath?

    @IBOutlet weak var languageButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.register(VersePortraitTableViewCell.nib, forCellReuseIdentifier: VersePortraitTableViewCell.identifier)
        self.tableView.register(VerseLandscapeTableViewCell.nib, forCellReuseIdentifier: VerseLandscapeTableViewCell.identifier)
        self.tableView.register(MarkReadTableViewCell.nib, forCellReuseIdentifier: MarkReadTableViewCell.identifier)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VerseTableViewController.receiveNotification), name: NSNotification.Name(rawValue: Bible.notificationKey), object: nil)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        load()
        updateUI()
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    func load() {
        verses = bible!.getVerses(book!, chapter: chapter!)
        subVerses = bible!.getSubVerses(book!, chapter: chapter!)
        
        let lang = bible!.getMainLanguage()
        
        if (UIApplication.shared.statusBarOrientation.isLandscape) {
            languageButton.title = "\(lang)/\(bible!.getSubLanguage())"
        } else {
            languageButton.title = lang
        }
    }
    
    func updateUI() {
        if let bible = bible, let book = book, showBookTitle {
            title = "\(bible.books[book].name) \(chapter!)장"
        } else {
            title = "\(chapter!)장"
        }
    }
    
    func update() {
        load()
        tableView.reloadData()
    }
    
    @objc func receiveNotification() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.update()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verses.count + 1
    }
    
    func getPortraitCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VersePortraitTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? VersePortraitTableViewCell {
            cell.indexLabel.text = "\((indexPath as NSIndexPath).row + 1)"
            cell.verseLabel.text = verses[(indexPath as NSIndexPath).row]
            if (selectedIndex as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
                cell.transLabel.text = subVerses[(indexPath as NSIndexPath).row]
            } else {
                cell.transLabel.text = ""
            }
        }
        
        return cell
    }
    
    func getLandscapeCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VerseLandscapeTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? VerseLandscapeTableViewCell {
            cell.indexLabel.text = "\((indexPath as NSIndexPath).row + 1)"
            cell.verseLabel.text = verses[(indexPath as NSIndexPath).row]
            cell.transLabel.text = subVerses[(indexPath as NSIndexPath).row]
            cell.verseRealLabel.text = verses[(indexPath as NSIndexPath).row]
            cell.transRealLabel.text = subVerses[(indexPath as NSIndexPath).row]
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == verses.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: MarkReadTableViewCell.identifier, for: indexPath)
            if let cell = cell as? MarkReadTableViewCell {
                cell.chapter = Chapter(bible: bible!, book: book!, chapter: chapter!)
            }
            return cell
        }
        
        if (UIApplication.shared.statusBarOrientation.isLandscape) {
            return getLandscapeCell(indexPath)
        } else {
            return getPortraitCell(indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (UIApplication.shared.statusBarOrientation.isLandscape) {
            tableView.deselectRow(at: indexPath, animated: false)
            return
        }
        
        if (selectedIndex as NSIndexPath?)?.row != (indexPath as NSIndexPath).row {
            selectedIndex = indexPath
        } else {
            selectedIndex = nil
        }
        tableView.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async(execute: { () -> Void in
            self.update()
        })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "Select Language":
                if let vc = segue.destination as? LanguageTableViewController {
                    vc.bible = bible
                }
            default: break
            }
        }
    }

}
