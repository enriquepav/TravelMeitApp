//
//  GoogleMapsView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 17/06/23.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    let locations: [CLLocation]
    let monumentsData: [MonumentData]
    
    @Binding var selectedMarker: GMSMarker?
    @ObservedObject var viewModel = MapRouteViewModel.shared
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView()
        mapView.settings.zoomGestures = true
        mapView.settings.scrollGestures = true
        
        mapView.delegate = context.coordinator // Assign delegate
        
        // ...
        
        // Calculate center coordinates
        var centerLatitude: CLLocationDegrees = 0.0
        var centerLongitude: CLLocationDegrees = 0.0
        for location in locations {
            centerLatitude += location.coordinate.latitude
            centerLongitude += location.coordinate.longitude
        }
        let centerLocation = CLLocation(latitude: centerLatitude / Double(locations.count), longitude: centerLongitude / Double(locations.count))
        
        // Set camera to center location
        let camera = GMSCameraPosition.camera(withTarget: centerLocation.coordinate, zoom: 15.0)
        mapView.camera = camera
        
        for index in 0..<(locations.count - 1) {
            let sourceLocation = locations[index]
            let destinationLocation = locations[index + 1]
            calculateRoute(from: sourceLocation, to: destinationLocation, mapView: mapView)
        }
        
        for monument in monumentsData {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: monument.latitude, longitude: monument.longitude)
            marker.title = monument.monument
            marker.map = mapView
        }
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {

    }
    
    private func calculateRoute(from source: CLLocation, to destination: CLLocation, mapView: GMSMapView) {
        let origin = "\(source.coordinate.latitude),\(source.coordinate.longitude)"
        let destination = "\(destination.coordinate.latitude),\(destination.coordinate.longitude)"
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=walking&key=AIzaSyC9LY0k_YloKpu_Ip2Amu82DPElu4jda_U"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data else {
                // Handle error
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                if let routes = json["routes"] as? [[String: Any]], let route = routes.first,
                   let legs = route["legs"] as? [[String: Any]], let leg = legs.first,
                   let duration = leg["duration"] as? [String: Any], let durationText = duration["text"] as? String
                {
                    for route in routes {
                        let routeOverviewPolyline = route["overview_polyline"] as! [String: Any]
                        let points = routeOverviewPolyline["points"] as! String
                        DispatchQueue.main.async {
                            self.drawRouteOnMap(from: points, mapView: mapView)
                        }
                    }
                    viewModel.getTotalDuration(durationText: durationText)
                    print("Total Time: \(durationText)")
                }else{
                    print("Unable to retrieve route information")
                }
            } catch {
                // Handle error
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    private func drawRouteOnMap(from encodedPath: String, mapView: GMSMapView) {
        let path = GMSPath(fromEncodedPath: encodedPath)
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .blue
        polyline.strokeWidth = 2.0
        
        // Create a custom stroke pattern for dotted lines
        let strokeStyle = GMSStrokeStyle.solidColor(.blue)
        let strokePattern = [GMSStrokeStyle.solidColor(.clear), strokeStyle]
        let spans = GMSStyleSpans(polyline.path!, strokePattern, [NSNumber(value: 1.0)], GMSLengthKind.rhumb)
        polyline.spans = spans
        
        
        polyline.map = mapView
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            parent.selectedMarker = marker
            if let title = marker.title {
                let snackbarView = UIView(frame: CGRect(x: 0, y: 0, width: mapView.frame.width, height: 50))
                snackbarView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
                
                let label = UILabel(frame: CGRect(x: 16, y: 0, width: snackbarView.frame.width - 32, height: snackbarView.frame.height))
                label.text = title
                label.textColor = .white
                
                snackbarView.addSubview(label)
                snackbarView.alpha = 0.0
                
                mapView.addSubview(snackbarView)
                
                UIView.animate(withDuration: 0.3, animations: {
                    snackbarView.alpha = 1.0
                }) { _ in
                    UIView.animate(withDuration: 0.3, delay: 2.0, options: [], animations: {
                        snackbarView.alpha = 0.0
                    }, completion: { _ in
                        snackbarView.removeFromSuperview()
                    })
                }
            }
            return true
        }
    }
    
}
