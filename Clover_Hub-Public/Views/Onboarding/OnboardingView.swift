//
//  OnboardingView.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/3/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let oliveGreen = Color(red: 110/255, green: 146/255, blue: 119/255)
    private let turquoise = Color(red: 75/255, green: 127/255, blue: 157/255)
    
    var body: some View {
        
        VStack {
            
            //tab view
            TabView(selection: $tabSelection) {
                
                //first tab
                VStack (spacing: 20){
                    
                    Image("world")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to Clover Hub!")
                        .font(Font.custom("OpenSans-Bold", size: 30))
                    Text("Clover Hub allows you to find the hidden clovers of whatever city you are in.")
                        .font(Font.custom("OpenSans-Regular", size: 15))
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                //second tab
                VStack (spacing: 20){
                    
                    Image("city")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover clovers?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues, and more - all based on your location.")
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            //button
            Button {
                
                //detect which tab it is
                if tabSelection == 0 {
                    //simply change to next tab
                    tabSelection = 1
                }
                //already on second tab
                else {
                    //request for geolocation of user
                    model.requestGeolocationPermission()
                    
                }
                
            } label: {
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height:48)
                        .cornerRadius(10)
                
                    //show next if first tab, get location otherwise
                    Text(tabSelection == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                    
                }
            }
            .accentColor(tabSelection == 0 ? oliveGreen : turquoise)
            .padding()

            Spacer()
            
        }
        .background(tabSelection == 0 ? oliveGreen : turquoise)
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

