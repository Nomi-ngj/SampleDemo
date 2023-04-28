//
//  ProductServiceContants.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import Foundation

struct NetworkContants{
    static var url:URL {
        #if Simpsons
            return URL(string: "http://api.duckduckgo.com/?q=simpsons+characters&format=json")!
        #else
            return URL(string: "http://api.duckduckgo.com/?q=the+wire+characters&format=json")!
        #endif
        
    }
}
