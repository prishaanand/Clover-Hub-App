//
//  BusinessMap.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/2/22.
//
//  Map view with all the businesses pinned.

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model:ContentModel
    //allows to read + write the val to state property in HomeView
    @Binding var selectedBusiness: Business?
    
    //create a set of annotations from our businesses
    var locations:[MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        //loop thru all restaurants and sights
        for business in model.restaurants + model.sights {
            
            //check for nil for lat + long (use optional binding)
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                //create new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude:long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
            
            
        }
        
        return annotations
    }
    
    //make
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        //allow system to hanndle annotation info creation
        mapView.delegate = context.coordinator
        
        //make the user show up on the map
        mapView.showsUserLocation = true
        //follow user w/rotation when change directions
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
        
    }
    
    //update - called several times as the data changes
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        //add the ones based on the business (zooms in as well)
        uiView.showAnnotations(self.locations, animated: true)
    }
    
    //dismantle
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    //MARK: Coordinator Class
    //delegate of the MKMapView
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            //dont provide details for user location annotation
            //is --> compares if something is a type if something else
            if annotation is MKUserLocation {
                return nil
            }
            
            //check if there is a resuable annotation view before creating a new one
            //reuseidentifier --> allows annotations scrolled off of screen to be repurposed for ones on the screen (save memory)
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationsReuseId)
            
            if annotationView == nil {
                //create a new annotation view
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationsReuseId)
                
                //tappable detail popup
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                //we got a reusable view
            annotationView!.annotation = annotation
            }
            
            //return it
            return annotationView
            
        }
        
        //detect user tapped on the annotation
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            //get the business object that this annotation represents
            //loop thru businesses in the model and find a match
            for business in map.model.restaurants + map.model.sights {
                
                //found match so set the selected business property to that business object
                if business.name == view.annotation?.title {
                    map.selectedBusiness = business
                    //exit once found match
                    return
                }
                
            }
            
            
            
        }
    }
}

