//
//  FeedVC - TableViewFunctions.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /* PART 2B START */
        return arrayOfSnaps.count
        /* PART 2B FINISH */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath[1]
        // look at DateFormatter documentation to figure out how to convert a SnapImage.timeSent to a label's text
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
            as! FeedTableViewCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        /* PART 2C START */
        cell.awakeFromNib()
        var dateString = formatter.string(from: arrayOfSnaps[index].timeSent)
        cell.senderLabel.text = arrayOfSnaps[index].sender
        cell.dateSentLabel.text = "Sent on \(dateString)"
        if (arrayOfSnaps[index].opened) {
            cell.hasBeenOpenedSquare.backgroundColor = .white
        } else {
            cell.hasBeenOpenedSquare.backgroundColor = .red
        }
        return cell
        /* PART 2C FINISH*/
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var index = indexPath[1]
        /* PART 2D START */
        selectedImage = arrayOfSnaps[index]
        if !selectedImage.opened {
            performSegue(withIdentifier: "toShowImage", sender: self)
        }
        selectedImage.opened = true
        tableView.deselectRow(at: indexPath, animated: true)

        /* PART 2D FINISH */
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}