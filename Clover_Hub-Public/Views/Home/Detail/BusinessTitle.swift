//
//  BusinessTitle.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/2/22.
//
// Reusable view for the business name, location, and rating.

import SwiftUI

struct BusinessTitle: View {
    
    var business:Business
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255)
    
    var body: some View {
        
        
            
            
            VStack (alignment: .leading) {
                
                //Business Name
                Text(business.name!)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("OpenSans-Regular", size: 22))
                    .foregroundColor(.white)
                    
                
                //Loop thru displayAddress
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                        Text(displayLine)
                            .font(Font.custom("OpenSans-Light", size: 18))
                            .foregroundColor(.white)
                        
                    }
                }
                
                //Rating
                Image("regular_\(business.rating ?? 0)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 30, alignment: .leading)
                    .padding()
                    .padding(.leading, -25)
                    .padding(.bottom, -10)
                    .padding(.top, -10)
                    .clipped()
            }
        
        
        
        
        
        
        
        
    }
}



