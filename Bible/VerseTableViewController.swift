//
//  VerseTableViewController.swift
//  Bible
//
//  Created by Eunmo Yang on 1/16/16.
//  Copyright © 2016 Eunmo Yang. All rights reserved.
//

import UIKit

class VerseTableViewController: UITableViewController {
    
    let verses = [
    "태초에 하나님이 천지를 창조하시니라",
    "땅이 혼돈하고 공허하며 흑암이 깊음 위에 있고 하나님의 신은 수면에 운행하시니라",
    "하나님이 가라사대 빛이 있으라 하시매 빛이 있었고",
        "그 빛이 하나님의 보시기에 좋았더라 하나님이 빛과 어두움을 나누사",
        "빛을 낮이라 칭하시고 어두움을 밤이라 칭하시니라 저녁이 되며 아침이 되니 이는 첫째 날이니라",
        "하나님이 가라사대 물 가운데 궁창이 있어 물과 물로 나뉘게 하리라 하시고",
        "하나님이 궁창을 만드사 궁창 아래의 물과 궁창 위의 물로 나뉘게 하시매 그대로 되니라",
        "하나님이 궁창을 하늘이라 칭하시니라 저녁이 되며 아침이 되니 이는 둘째 날이니라",
        "하나님이 가라사대 천하의 물이 한곳으로 모이고 뭍이 드러나라 하시매 그대로 되니라",
        "하나님이 뭍을 땅이라 칭하시고 모인 물을 바다라 칭하시니라 하나님의 보시기에 좋았더라",
        "하나님이 가라사대 땅은 풀과 씨 맺는 채소와 각기 종류대로 씨 가진 열매 맺는 과목을 내라 하시매 그대로 되어",
        "땅이 풀과 각기 종류대로 씨 맺는 채소와 각기 종류대로 씨 가진 열매 맺는 나무를 내니 하나님의 보시기에 좋았더라",
        "저녁이 되며 아침이 되니 이는 세째 날이니라",
        "하나님이 가라사대 하늘의 궁창에 광명이 있어 주야를 나뉘게 하라 또 그 광명으로 하여 징조와 사시와 일자와 연한이 이루라",
        "또 그 광명이 하늘의 궁창에 있어 땅에 비취라 하시고 (그대로 되니라)",
        "하나님이 두 큰 광명을 만드사 큰 광명으로 낮을 주관하게 하시고 작은 광명으로 밤을 주관하게 하시며 또 별들을 만드시고",
        "하나님이 그것들을 하늘의 궁창에 두어 땅에 비취게 하시며",
        "주야를 주관하게 하시며 빛과 어두움을 나뉘게 하시니라 하나님의 보시기에 좋았더라",
        "저녁이 되며 아침이 되니 이는 네째 날이니라",
        "하나님이 가라사대 물들은 생물로 번성케 하라 땅위 하늘의 궁창에는 새가 날으라 하시고",
        "하나님이 큰 물고기와 물에서 번성하여 움직이는 모든 생물을 그 종류대로, 날개 있는 모든 새를 그 종류대로 창조하시니 하나님의 보시기에 좋았더라",
        "하나님이 그들에게 복을 주어 가라사대 생육하고 번성하여 여러 바다 물에 충만하라 새들도 땅에 번성하라 하시니라",
        "저녁이 되며 아침이 되니 이는 다섯째 날이니라",
        "하나님이 가라사대 땅은 생물을 그 종류대로 내되 육축과 기는 것과 땅의 짐승을 종류대로 내라 하시고 (그대로 되니라)",
        "하나님이 땅의 짐승을 그 종류대로, 육축을 그 종류대로, 땅에 기는 모든 것을 그 종류대로 만드시니 하나님의 보시기에 좋았더라",
        "하나님이 가라사대 우리의 형상을 따라 우리의 모양대로 우리가 사람을 만들고 그로 바다의 고기와 공중의 새와 육축과 온 땅과 땅에 기는 모든 것을 다스리게 하자 하시고",
        "하나님이 자기 형상 곧 하나님의 형상대로 사람을 창조하시되 남자와 여자를 창조하시고",
        "하나님이 그들에게 복을 주시며 그들에게 이르시되 생육하고 번성하여 땅에 충만하라, 땅을 정복하라, 바다의 고기와 공중의 새와 땅에 움직이는 모든 생물을 다스리라 하시니라",
        "하나님이 가라사대 내가 온 지면의 씨 맺는 모든 채소와 씨 가진 열매 맺는 모든 나무를 너희에게 주노니 너희 식물이 되리라",
        "또 땅의 모든 짐승과 공중의 모든 새와 생명이 있어 땅에 기는 모든 것에게는 내가 모든 푸른 풀을 식물로 주노라 하시니 그대로 되니라",
        "하나님이 그 지으신 모든 것을 보시니 보시기에 심히 좋았더라 저녁이 되며 아침이 되니 이는 여섯째 날이니라"
    ]
    
    let subVerses = [
        "In the beginning God created the heavens and the earth.",
        "Now the earth was formless and empty, darkness was over the surface of the deep, and the Spirit of God was hovering over the waters.",
        "And God said, \"Let there be light,\" and there was light.",
        "God saw that the light was good, and He separated the light from the darkness.",
        "God called the light \"day,\" and the darkness he called \"night.\" And there was evening, and there was morning--the first day.",
        "And God said, \"Let there be an expanse between the waters to separate water from water.\"",
        "So God made the expanse and separated the water under the expanse from the water above it. And it was so.",
        "God called the expanse \"sky.\" And there was evening, and there was morning--the second day.",
        "And God said, \"Let the water under the sky be gathered to one place, and let dry ground appear.\" And it was so.",
        "God called the dry ground \"land,\" and the gathered waters he called \"seas.\" And God saw that it was good.",
        "Then God said, \"Let the land produce vegetation: seed-bearing plants and trees on the land that bear fruit with seed in it, according to their various kinds.\" And it was so.",
        "The land produced vegetation: plants bearing seed according to their kinds and trees bearing fruit with seed in it according to their kinds. And God saw that it was good.",
        "And there was evening, and there was morning--the third day.",
        "And God said, \"Let there be lights in the expanse of the sky to separate the day from the night, and let them serve as signs to mark seasons and days and years,",
        "and let them be lights in the expanse of the sky to give light on the earth.\" And it was so.",
        "God made two great lights--the greater light to govern the day and the lesser light to govern the night. He also made the stars.",
        "God set them in the expanse of the sky to give light on the earth,",
        "to govern the day and the night, and to separate light from darkness. And God saw that it was good.",
        "And there was evening, and there was morning--the fourth day.",
        "And God said, \"Let the water teem with living creatures, and let birds fly above the earth across the expanse of the sky.\"",
        "So God created the great creatures of the sea and every living and moving thing with which the water teems, according to their kinds, and every winged bird according to its kind. And God saw that it was good.",
        "God blessed them and said, \"Be fruitful and increase in number and fill the water in the seas, and let the birds increase on the earth.",
        "And there was evening, and there was morning--the fifth day.",
        "And God said, \"Let the land produce living creatures according to their kinds: livestock, creatures that move along the ground, and wild animals, each according to its kind.\" And it was so.",
        "God made the wild animals according to their kinds, the livestock according to their kinds, and all the creatures that move along the ground according to their kinds. And God saw that it was good.",
        "Then God said, \"Let us make man in our image, in our likeness, and let them rule over the fish of the sea and the birds of the air, over the livestock, over all the earth, and over all the creatures that move along the ground.\"",
        "So God created man in his own image, in the image of God he created him; male and female he created them.",
        "God blessed them and said to them, \"Be fruitful and increase in number; fill the earth and subdue it. Rule over the fish of the sea and the birds of the air and over every living creature that moves on the ground.\"",
        "Then God said, \"I give you every seed-bearing plant on the face of the whole earth and every tree that has fruit with seed in it. They will be yours for food.",
        "And to all the beasts of the earth and all the birds of the air and all the creatures that move on the ground--everything that has the breath of life in it--I give every green plant for food.\" And it was so.",
        "God saw all that he had made, and it was very good. And there was evening, and there was morning--the sixth day."
    ]
    
    var selectedIndex: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
        //tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verses.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VerseTableViewCell", forIndexPath: indexPath) as! VerseTableViewCell

        // Configure the cell...
        cell.indexLabel.text = "\(indexPath.row + 1)"
        cell.verseLabel.text = verses[indexPath.row]
        if selectedIndex?.row == indexPath.row {
            cell.transLabel.text = subVerses[indexPath.row]
        } else {
            cell.transLabel.text = ""
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if selectedIndex?.row != indexPath.row {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
