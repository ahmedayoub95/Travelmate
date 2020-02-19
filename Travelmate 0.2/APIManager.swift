//
//  APIManager.swift
//  Travelmate 0.2
//
//  Created by MacBook  on 2/19/20.
//  Copyright © 2020 Saami. All rights reserved.
//

import Foundation
let headers = [
    "x-rapidapi-host": "cometari-airportsfinder-v1.p.rapidapi.com",
    "x-rapidapi-key": "SIGN-UP-FOR-KEY"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/by-text?text=Berlin")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error ?? "Error getting data")
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse ?? "Data Successfully getted")
    }
})

//dataTask.resume()
