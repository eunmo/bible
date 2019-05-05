//
//  BooksCollectionViewController.swift
//  Bible
//
//  Created by Eunmo Yang on 1/16/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import UIKit

class BookCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    var bible: Bible?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        NotificationCenter.default.addObserver(self, selector: #selector(ChapterCollectionViewController.receiveNotification), name: NSNotification.Name(rawValue: Bible.notificationKey), object: nil)

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        bible = Bible()
        
        if #available(iOS 11.0, *) {
            collectionView?.contentInsetAdjustmentBehavior = .always
        }
    }
    
    @objc func receiveNotification() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.collectionView?.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return section == 0 ? 39 : 27
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
    
        // Configure the cell
        cell.label.text = bible!.getAbbr(indexPath)
        
        let (read, count) = bible!.getChaptersRead(in: indexPath)
        
        if read == 0 {
            cell.backgroundColor = UIColor.white
            cell.label.textColor = UIColor.black
        } else if read == count {
            cell.backgroundColor = UIColor.black
            cell.label.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.darkGray
            cell.label.textColor = UIColor.white
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BookCollectionViewHeader", for: indexPath) as! BookCollectionReusableView
            
            headerView.label.text = indexPath.section == 0 ? "구약" : "신약"
            return headerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
        return UICollectionReusableView()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "Show Chapters":
                if let vc = segue.destination as? ChapterCollectionViewController {
                    let indexPath = collectionView?.indexPathsForSelectedItems![0]
                    vc.bible = bible
                    vc.book = bible?.getBook(indexPath!)
                }
            default: break
            }
        }
    }

}
