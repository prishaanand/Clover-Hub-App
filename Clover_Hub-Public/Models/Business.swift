//
//  Business.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/1/22.
//
// Use to decode the fetched JSON. Use enum CodingKeys to allow for liberty in var naming.

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imageUrl: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData() {
        
        //check image url isn't nil
        guard imageUrl != nil else {
            return
        }
        
        //download data for the image
        if let url = URL(string: imageUrl!) {
            
            //get a session
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    
                    //make sure image updating gets done in the main thread
                    DispatchQueue.main.async {
                        //set image data
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
}

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "zip_code"
        case displayAddress = "display_address"
        
        case address1
        case address2
        case address3
        case city
        case country
        case state
        
    }
}

struct Category: Decodable {
    var alias: String?
    var title: String?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}

