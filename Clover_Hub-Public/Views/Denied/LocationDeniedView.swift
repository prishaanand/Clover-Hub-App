//
//  LocationDeniedView.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/3/22.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 67/255, green: 83/255, blue: 118/255)
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            Spacer()
            
            Image("map")
            
            Spacer()
            
            Text("Uh Oh!")
                .font(Font.custom("OpenSans-Bold", size: 30))
            
            
            Text("Hey explorer ... we need permission to access your location to give you the location of the best clovers in the city. You can change your decision anytime in Settings.")
                .font(Font.custom("OpenSans-Regular", size: 15))
            
            Spacer()
            
            Button {
                
                //open settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    //check if openable by url
                    if UIApplication.shared.canOpenURL(url) {
                        //can safely open
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    
                }
                
                
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text("Take Me to Settings!")
                        .font(Font.custom("OpenSans-Bold", size: 20))
                        .foregroundColor(backgroundColor)
                        .padding()
                    
                }
                
                
            }
            .padding()
            Spacer()
            
        }
        .padding()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}

