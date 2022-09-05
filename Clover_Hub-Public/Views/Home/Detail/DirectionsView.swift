//
//  DirectionsView.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/2/22.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255)
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            //business title
            HStack{
                BusinessTitle(business: business)
                Spacer()
                //option to open in apple maps
                
                //check if not nil
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = business.name {
                    Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                    .font(Font.custom("OpenSans-Light", size: 20))
                    .foregroundColor(.white)
                }
               
            }
            .padding()
            
            //directions map
            DirectionsMap(business: business)
            
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(oliveGreen)
        
    }
}

