//
//  BusinessDetail.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/2/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255, opacity: 0.8)
    private let cloverGreen = Color(red: 162/255 , green: 217/255, blue: 152/255, opacity: 0.5)
    private let openGreen = Color(red: 162/255 , green: 217/255, blue: 152/255)
    private let buttonGreen = Color(red: 110/255, green: 146/255, blue: 119/255)
    
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader() { geo in
                    
                    //set corresponding image
                    let uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                //indicate if open or closed
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : openGreen)
                        
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .font(Font.custom("OpenSans-Regular", size: 20))
                }
                .padding(.top, -20)
            }
            
            
            
            //more then 10 elements, so must group
            Group {
                
                HStack {
                    
                   
                    BusinessTitle(business: business)
                        .padding()
                    Spacer()
                    YelpAttribution(link: business.url!)
                    
                }
                
                
                DashedDivider()
                    .padding(.horizontal)
                
                //Phone
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(oliveGreen)
                        .cornerRadius(10)
                        //.opacity(0.8)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Phone:")
                            .font(Font.custom("OpenSans-Regular", size: 18))
                            .padding(.leading)
                            
                        Text(business.displayPhone ?? "")
                            .font(Font.custom("OpenSans-Light", size: 15))
                        Spacer()
                        
                        //link number to phone app
                        Image(systemName: "phone")
                        Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                            .font(Font.custom("OpenSans-Regular", size: 15))
                            .padding(.trailing)
                            
                    }
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    
                }
                
                DashedDivider()
                    .padding(.horizontal)
                
                //Reviews
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(oliveGreen)
                        .cornerRadius(10)
                        //.opacity(0.8)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Reviews:")
                            .font(Font.custom("OpenSans-Regular", size: 18))
                            .padding(.leading)
                        Text(String(business.reviewCount ?? 0))
                            .font(Font.custom("OpenSans-Light", size: 15))
                        
                        Spacer()
                        
                        //link number to reviews page
                        Image(systemName: "book")
                        Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                            .font(Font.custom("OpenSans-Regular", size: 15))
                            .padding(.trailing)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                
                DashedDivider()
                    .padding(.horizontal)
                
                //Website
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(oliveGreen)
                        .cornerRadius(10)
                        //.opacity(0.8)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Website:")
                            .font(Font.custom("OpenSans-Regular", size: 18))
                            .padding(.leading)
                        Text(business.url ?? "")
                            .lineLimit(1)
                            .font(Font.custom("OpenSans-Light", size: 15))
                        
                        Spacer()
                        //link number to phone app
                        Image(systemName: "laptopcomputer")
                        Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                            .font(Font.custom("OpenSans-Regular", size: 15))
                            .padding(.trailing)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    
                }
                
                
                
                DashedDivider()
                    .padding(.horizontal)
            }
            
            //get directions button
            Button {
                //show directions
                showDirections = true
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(buttonGreen)
                        .cornerRadius(10)
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .font(Font.custom("OpenSans-Bold", size: 20))
                    
                }
            }
            .padding()
            //show directions sheet when button clicked
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
            }

        }

        .background(oliveGreen)
                
    }
}



