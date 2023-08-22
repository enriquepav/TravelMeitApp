//
//  MyBackgroundTask.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 21/08/23.
//

import Foundation

class MyBackgroundTask: NSObject, BGTask {
    var taskIdentifier: String? = "com.example.mybackgroundtask"

    func execute(_ task: BGTask) {
        // Tu lógica aquí
        task.setTaskCompleted(success: true)
    }
}
