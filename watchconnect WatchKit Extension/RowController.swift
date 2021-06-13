//
//  RowController.swift
//  watchconnect WatchKit Extension
//
//  Created by HAYATOYAMAMOTo on 2021/06/12.
//

import WatchKit

class RowController: NSObject {
    
    @IBOutlet weak var nameLabel: WKInterfaceLabel!
    @IBOutlet weak var emojiLabel: WKInterfaceLabel!
    
    var data: (String, String)? {
        didSet {
            guard let data = data else { return }
            nameLabel.setText(data.0)
            emojiLabel.setText(data.1)
        }
    }
        
}
