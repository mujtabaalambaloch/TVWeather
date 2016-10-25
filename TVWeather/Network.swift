//
//  Network.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import UIKit
import ReachabilitySwift
import Alamofire

class Network: NSObject {
    
    // MARK: Check Connectivity
    
    func hasConnectivity() -> Bool {
        
        let reachability = Reachability()!
        if reachability.isReachable {
            return true
        } else {
            return false
        }
    }
    
    // MARK: API Request (Get)
    
    func getRequest(url:String, completion: ((_ success : Bool?, _ response: String?) -> Void)?) {
        
        Alamofire.request(url)
            .validate(statusCode: 200..<300)
            .responseString { response in
                
                let result = response.result
                
                switch result {
                case .success:
                    //print("Validation Successful")
                    completion!(true, result.value)
                case .failure( _):
                    //print("Error")
                    completion!(false, "")
                }
        }
    }
}
