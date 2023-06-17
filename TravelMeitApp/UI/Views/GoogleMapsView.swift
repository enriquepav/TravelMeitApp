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
    }

    private func calculateRoute(from source: CLLocation, to destination: CLLocation, mapView: GMSMapView) {
        let origin = "\(source.coordinate.latitude),\(source.coordinate.longitude)"
        let destination = "\(destination.coordinate.latitude),\(destination.coordinate.longitude)"
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&key=AIzaSyCtUQw3A70kKvEBgWmv7YMmJQsFM2YKfus"

        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data else {
                // Handle error
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let routes = json["routes"] as! [[String: Any]]
                for route in routes {
                    let routeOverviewPolyline = route["overview_polyline"] as! [String: Any]
                    let points = routeOverviewPolyline["points"] as! String
                    DispatchQueue.main.async {
                        self.drawRouteOnMap(from: points, mapView: mapView)
                    }
                }
            } catch {
                // Handle error
            }
        }.resume()
    }

    private func drawRouteOnMap(from encodedPath: String, mapView: GMSMapView) {
        let path = GMSPath(fromEncodedPath: encodedPath)
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .blue
        polyline.strokeWidth = 5.0
        polyline.map = mapView
    }
}
