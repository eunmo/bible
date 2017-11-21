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
        NotificationCenter.default.addObserver(self, selector: #selector(VerseTableViewController.receiveNotification), name: NSNotification.Name(rawValue: Bible.notificationKey), object: nil)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        load()
        updateUI()
    }
    
    func load() {
        verses = bible!.getVerses(book!, chapter: chapter!)
        subVerses = bible!.getSubVerses(book!, chapter: chapter!)
        languageButton.title = bible!.getLanguage()
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerseTableViewCell", for: indexPath) as! VerseTableViewCell

        // Configure the cell...
        cell.indexLabel.text = "\((indexPath as NSIndexPath).row + 1)"
        cell.verseLabel.text = verses[(indexPath as NSIndexPath).row]
        if (selectedIndex as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
            cell.transLabel.text = subVerses[(indexPath as NSIndexPath).row]
        } else {
            cell.transLabel.text = ""
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (selectedIndex as NSIndexPath?)?.row != (indexPath as NSIndexPath).row {
            selectedIndex = indexPath
        } else {
            selectedIndex = nil
        }
        tableView.reloadData()
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
