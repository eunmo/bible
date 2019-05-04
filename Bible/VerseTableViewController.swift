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
        let fullLang = "\(lang)/\(bible!.getSubLanguage())"
        
        switch UIApplication.shared.statusBarOrientation {
        case .landscapeLeft:
            languageButton.title = fullLang
        case .landscapeRight:
            languageButton.title = fullLang
        case .portrait:
            languageButton.title = lang
        case .portraitUpsideDown:
            languageButton.title = lang
        case .unknown:
            languageButton.title = lang
        }
    }
    
    func updateUI() {
        title = "\(chapter!)장"
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
        return verses.count
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
        switch UIApplication.shared.statusBarOrientation {
        case .landscapeLeft:
            return getLandscapeCell(indexPath)
        case .landscapeRight:
            return getLandscapeCell(indexPath)
        case .portrait:
            return getPortraitCell(indexPath)
        case .portraitUpsideDown:
            return getPortraitCell(indexPath)
        case .unknown:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
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
