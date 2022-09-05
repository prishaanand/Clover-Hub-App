//
//  BusinessRow.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/1/22.
//

import SwiftUI

struct BusinessRow: View {
    
    //populates image data
    @ObservedObject var business: Business
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255, opacity: 0.8)
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                //image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(5)
                    .scaledToFit()
                    .padding()
                    .padding(.trailing, -10)
                
                //name + distance
                VStack (alignment: .leading) {
                    Text(business.name ?? "")
                        .font(Font.custom("OpenSans-Regular", size: 18))
                        .multilineTextAlignment(.leading)
                    //format: specifies the num of decimal places
                    Text(String(format:"%.1f km away", (business.distance ?? 0) / 1000))
                        .font(Font.custom("OpenSans-Light", size: 15))
                    
                }
                .padding(.vertical)
                
                Spacer()
                
                //star rating + num of reviews
                VStack (alignment: .leading) {
                    Image("regular_\(business.rating ?? 0)")
                        .resizable()
                        .scaledToFill()
                        .padding()
                        .padding(.leading, -20)
                        .frame(width: 130, height: 25)
                        .clipped()
                    Text(" \(business.reviewCount ?? 0) Reviews")
                        .font(Font.custom("OpenSans-Light", size: 15))
                }
                
            }
            
        }
        .foregroundColor(.white)
        .background(oliveGreen)
        .cornerRadius(10)
        
    }
}


