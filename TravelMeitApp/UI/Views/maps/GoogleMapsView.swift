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
    @State private var marker: GMSMarker? = nil

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: locations[0].coordinate.latitude,
                                              longitude: locations[0].coordinate.longitude,
                                              zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        // Remove any existing overlays on the map
        mapView.clear()

        // Draw the route
        for index in 0..<(locations.count - 1) {
            let sourceLocation = locations[index]
            let destinationLocation = locations[index + 1]
            calculateRoute(from: sourceLocation, to: destinationLocation, mapView: mapView)
        }
        
        for location in locations {
            let marker = GMSMarker()
            marker.position = location.coordinate
            marker.title = "Marker"
            marker.map = mapView
        }
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

}
