//
//  NetworkMonitor.swift
//  CheckNetworkConnection
//
//  Created by Muhammad Wasiq  on 28/11/2023.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    var text: String = ""
    var status: Bool = false
    
    let monitor = NWPathMonitor()
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
                self.text = "We're connected!"
                self.status = true
                // post connected notification
            } else {
                print("No connection.")
                self.text = "Not connected!"
                self.status = false
                // post disconnected notification
            }
            print(path.isExpensive)
        }
        
        // Start Monitoring
        let queue = DispatchQueue(label: "NetworkMonitor")
                monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
