//
//  InterfaceController.swift
//  watchconnect WatchKit Extension
//
//  Created by HAYATOYAMAMOTo on 2021/06/12.
//

import WatchKit
import WatchConnectivity
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    let phoneconnector = PhoneConnector()
    let animals = [("ネコ", "🐱"), ("イヌ", "🐶"), ("ハムスター", "🐹"), ("ドラゴン", "🐲"), ("ユニコーン", "🦄")]
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
        phoneconnector.send(index: rowIndex, animals: animals)
        //let item = animals[rowIndex]
        //presentController(withName: "Cell", context: item)
    }

}

class PhoneConnector: NSObject, WCSessionDelegate {
    
    var session: WCSession
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("The session has completed activation.")
                }
    }
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        if WCSession.isSupported() {
            self.session.delegate = self
            WCSession.default.activate()
        }
    }
    
    func send(index: Int, animals : [(String, String)]) {
        let animal: (String, String) = animals[index]
        let message = ["MESSAGE": "Hello iPhone!!"]
        DispatchQueue.main.async {
//            if WCSession.default.isReachable {
                WCSession.default.sendMessage(message, replyHandler: { (reply) in do {
                    print("send to replyHandler")
                }}) { (error) in
                    print(error.localizedDescription)
                }
//            }
        }
    }
    
}

