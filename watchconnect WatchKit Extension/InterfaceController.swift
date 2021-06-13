//
//  InterfaceController.swift
//  watchconnect WatchKit Extension
//
//  Created by HAYATOYAMAMOTo on 2021/06/12.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    let animals = [("ネコ", "🐱"), ("イヌ", "🐶"), ("ハムスター", "🐹"), ("ドラゴン", "🐲"), ("ユニコーン", "🦄")]
    let emojiAnimals = ["🐱", "🐶", "🐹", "🐲", "🦄"]

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        table.setNumberOfRows(animals.count, withRowType: "Row")
        for i in 0 ..< table.numberOfRows {
            guard let controller = table.rowController(at: i) as? RowController else { continue }
            controller.data = animals[i]
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let item = animals[rowIndex]
        presentController(withName: "Cell", context: item)
    }

}
