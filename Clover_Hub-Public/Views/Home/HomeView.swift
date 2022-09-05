//
//  HomeView.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/1/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness:Business?
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255)
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0{
            
            NavigationView {
                //determine if we should show list or map
                if !isMapShowing {
                    
                    //MARK: show list
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "mappin")
                            Text(model.placemark?.locality ?? "")
                                .font(Font.custom("OpenSans-Regular", size: 20))
                            
                            Spacer()
                            Button("Switch to Map View") {
                                self.isMapShowing = true
                            }
                            .font(Font.custom("OpenSans-Regular", size: 20))
                            .foregroundColor(oliveGreen)
                        }
                        
                        
                        Divider()
                        
                        ZStack (alignment: .top) {
                            
                            BusinessList()
                            
                            HStack {
                                
                                Spacer()
                                YelpAttribution(link: "https://yelp.ca")
                                
                            }
                        }
                        
                        
                    }
                    .padding([.horizontal, .top])
                    //add this modifier to the child view of the nav view, rather than entire nav view itself
                    .navigationBarHidden(true)
                    
                }
                else {
                    //MARK: show map
                    
                    ZStack (alignment: .top) {
                        
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                
                                //create a business detail view instance
                                //pass in the selected business
                                BusinessDetail(business: business)
                            }
                        
                        //rect to toggle back
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack {
                                Image(systemName: "mappin")
                                Text(model.placemark?.locality ?? "")
                                    .font(Font.custom("OpenSans-Regular", size: 20))
                                Spacer()
                                Button("Switch to List View") {
                                    self.isMapShowing = false
                                }
                                .font(Font.custom("OpenSans-Regular", size: 20))
                                .foregroundColor(oliveGreen)
                            }
                            .padding()
                        }
                        .padding()
                        
                    }
                    //always put on the child view of the nav view!!
                    .navigationBarHidden(true)
                }
            }
            
            
        }
        else {
            //show spinner while waiting for data
            ProgressView()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

