//
//  MapRouteViewModel.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 23/06/23.
//

import Foundation

final class MapRouteViewModel: ObservableObject {
    @Published var totalDuration: TimeInterval = 0
    @Published private var totalTime: TimeInterval = 0
    static let shared = MapRouteViewModel()

    func getTotalDuration(durationText: String) {
        let components = durationText.components(separatedBy: " ")
        if components.count == 2, let value = TimeInterval(components[0]), let unit = DurationUnit(rawValue: components[1]) {
            totalDuration += value * unit.secondsMultiplier
            totalTime = totalDuration
        }
    }
    
    func clearTotalDuration(){
        totalDuration = 0
        totalTime = 0
    }
    
    func formattedDuration(_ duration: TimeInterval) -> String {
        if duration >= DurationUnit.hours.secondsMultiplier {
            let hours = Int(duration / DurationUnit.hours.secondsMultiplier)
            let minutes = Int((duration / DurationUnit.minutes.secondsMultiplier).truncatingRemainder(dividingBy: 60))
            return "\(hours)h \(minutes)min"
        } else {
            let minutes = Int(duration / DurationUnit.minutes.secondsMultiplier)
            let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
            if (seconds != 0){
                return "\(minutes)min \(seconds)s"
            }
            else {
                return "\(minutes)min"
            }
        }
    }

    enum DurationUnit: String {
        case seconds = "s"
        case minutes = "min"
        case hours = "h"

        var secondsMultiplier: TimeInterval {
            switch self {
            case .seconds:
                return 1
            case .minutes:
                return 60
            case .hours:
                return 3600
            }
        }
    }
}
