//
//  LaunchView.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 8/31/22.
//
// Shows proper view depending on authorization status of geolocating the user

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        //authorization undetermined
        if model.authorizationState == .notDetermined {
            //show onbording
            OnboardingView()
            
        }
        //authorization approved
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            //show home view
            HomeView()
        }
        //authorization denied
        else {
            //show denied view
            LocationDeniedView()
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

