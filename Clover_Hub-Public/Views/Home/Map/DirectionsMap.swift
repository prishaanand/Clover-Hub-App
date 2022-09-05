//
//  DirectionsMap.swift
//  Clover-Hub
//
//  Created by Prisha Anand on 9/3/22.
//

import SwiftUI
import MapKit

struct DirectionsMap : UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    var business:Business
    
    //computed property for start of the map route
    var start:CLLocationCoordinate2D {
        return model.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
    }
    
    //computed property for end of the map route
    var end:CLLocationCoordinate2D {
        
        //check for nil
        if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
        }
        else {
            return CLLocationCoordinate2D()
        }
        
    }
    
    //make
    func makeUIView(context: Context) -> MKMapView {
        
        //create map
        let map = MKMapView()
        map.delegate = context.coordinator
        
        //show the user location
        map.showsUserLocation = true
        map.userTrackingMode = .followWithHeading
        
        //create directions request
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
        
        //create directions object
        let directions = MKDirections(request: request)
        
        //calculate route
        directions.calculate { response, error in
            
            //no error but respone
            if error == nil && response != nil {
                //loop thru all routes + plot route
                for route in response!.routes {
                    map.addOverlay(route.polyline)
                    //zoom into appropriate region
                    map.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
                }
            }
        }
        
        // Place annotation for the end point
        let annotation = MKPointAnnotation()
        annotation.coordinate = end
        annotation.title = business.name ?? ""
        map.addAnnotation(annotation)
        
        
        return map
    }
    
    //update
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    //dismantle
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
    }
    
    //MARK: Coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    //specifics of the map polyline (drawn route)
    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
            
        }
        
        
    }
    
    
}
