//
//  ViewController.swift
//  watchconnect
//
//  Created by HAYATOYAMAMOTo on 2021/06/12.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let watchConnector = WatchConnector()
    }


}

class WatchConnector: NSObject, WCSessionDelegate {
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith state= \(activationState.rawValue)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
    
    //func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
    //    DispatchQueue.main.async {
    //        let data = message["MESSAGE"] as! String
    //        print("didReceiveMessage: \(data)")
    //    }
        
    //    replyHandler(["message" : "replyHandler"])
    //}
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            let data = message["MESSAGE"] as! String
            print("didReceiveMessage: \(data)")
        }
    }
    
    
}
