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
    }
    
}

class WatchConnector: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published var receivedMessage = "WATCH : 未受信"
    @Published var count = 0

    
    var dataM: String = "" {
        didSet {
            print("receive data: \(dataM)")
        }
    }
    
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
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        DispatchQueue.main.async { [self] in
            print("message rowdata : \(message)")
            let data = message["MESSAGE"] as! String
            print("didReceiveMessage: \(data)")
            dataM = message["MESSAGE"] as! String
            
            self.receivedMessage = "PHONE : \(message["MESSAGE"] as! String)"
            print("self.receivedMessage \(self.receivedMessage)")
        }
        
        replyHandler(["MESSAGE" : "replyHandler"])
    }
    
    //func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    //    DispatchQueue.main.async {
    //        let data = message["MESSAGE"] as! String
    //        print("didReceiveMessage: \(data)")
    //    }
    //}
    
    
}
