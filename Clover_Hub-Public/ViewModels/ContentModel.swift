//
//  ContentModel.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/1/22.
//
// Data for the app -- CoreLocation framework.

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    

    //create a core loc manager
    var locationManager = CLLocationManager()
    
    //store the authorization statis
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    @Published var placemark: CLPlacemark?
    
    override init() {
        //need to override NSObj init method first, and then call it before running our own custom code
        super.init()
        
        //set content model as the delegate of the location manager
        locationManager.delegate = self
        
    }
    
    func requestGeolocationPermission() {
        //request permission from the user
        locationManager.requestWhenInUseAuthorization()
    }
    
    //MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //update the authorizationState property
        authorizationState = locationManager.authorizationStatus
        
        //current authorization status for the app
        //alr set to not determined by default
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            //we have permission to locate the user
            //start geolocating the user (only works if user has granted permission)
            locationManager.startUpdatingLocation()
            
            
        }
        else if locationManager.authorizationStatus == .denied {
            //dont have permission
            
        }
    }
    
    //gives us the location of the user (continually fires)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //current loc
        let userLocation = locations.first
        
        //have a valid location
        if userLocation != nil {
            //stop requesting the location after getting it once
            locationManager.stopUpdatingLocation()
            
            //get the placemark of the user (user-friendly location name)
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(userLocation!) { placemarks, error in
                
                //check there aren't erros
                if error == nil && placemarks != nil {
                    //take the first placemark
                    self.placemark = placemarks?.first
                }
                
                
                
            }
            
            //send coordinates of the user into Yelp API
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
            
        }
    }
    
    //MARK: Yelp API methods
    func getBusinesses(category: String, location:CLLocation) {
        
        //create URL
        //first approach
        /*let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        
        let url = URL(string: urlString)
        */
        
        //second approach
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        let url = urlComponents?.url
        
        //not nil value
        if let url = url {
            //create URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            //get URLSession
            let session = URLSession.shared
            
            //create data task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                //check there is no error
                if error == nil {
                    
                    //parse json
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        //sort businesses by distance
                        var businesses = result.businesses
                        businesses.sort { b1, b2 in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        //call get image for businesses
                        for b in businesses {
                            b.getImageData()
                        }
                        
                        
                        DispatchQueue.main.async {
                            //assign results to the appropriate property
                            //this owuld be considered a background thread! (which is why we place it inside a dispatch queue)
                            switch category {
                                case Constants.sightsKey:
                                    self.sights = businesses
                                case Constants.restaurantsKey:
                                     self.restaurants = businesses
                                default:
                                    break
                            }
                            
                        }
                        
                    }
                    catch {
                        print(error)
                    }
                    
                }
            }
            
            //start the data task
            dataTask.resume()
        }
        
    }
    
}

