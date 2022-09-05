//
//  BusinessList.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/1/22.
//
// Displays the list of businesses returned form the Yelp API.

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255)
    
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Places to Eat", businesses: model.restaurants)
                    .font(Font.custom("OpenSans-Bold", size: 20))
                    .foregroundColor(oliveGreen)
                BusinessSection(title: "Things to Do", businesses: model.sights)
                    .font(Font.custom("OpenSans-Bold", size: 20))
                    .foregroundColor(oliveGreen)
            }
        }
        
        
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}

