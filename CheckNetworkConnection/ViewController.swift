//
//  ViewController.swift
//  CheckNetworkConnection
//
//  Created by Muhammad Wasiq  on 28/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var connectionStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkMonitor.shared.startMonitoring()
        if NetworkMonitor.shared.status == true {
            connectionStatus.text = NetworkMonitor.shared.text
        }
        else{
            connectionStatus.text = NetworkMonitor.shared.text
        }
    }

}

