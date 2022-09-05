//
//  BusinessSearch.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/1/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    var center = Coordinate()
}

