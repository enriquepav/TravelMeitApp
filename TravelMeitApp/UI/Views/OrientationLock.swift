//
//  OrientationLock.swift
//  TravelMeitApp
//
//  Created by Enrique Alata Vences on 21/07/23.
//

import UIKit
import SwiftUI

final class OrientationLock {
    static var orientationLock: UIInterfaceOrientationMask = .all
    
    static func lock(_ orientation: UIInterfaceOrientationMask) {
        orientationLock = orientation
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.orientationLock = orientation
        }
    }
    
    static func unlock() {
        orientationLock = .all
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.orientationLock = .all
        }
    }
}

struct OrientationLockView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<OrientationLockView>) -> UIViewController {
        return OrientationViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<OrientationLockView>) {}
}

final class OrientationViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OrientationLock.lock(.portrait) // Aquí puedes cambiar la orientación bloqueada según tus necesidades.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        OrientationLock.unlock()
    }
}

extension AppDelegate {
    override func buildConfiguration() {
        super.buildConfiguration()
        OrientationLock.lock(.portrait) // Aquí puedes cambiar la orientación bloqueada según tus necesidades.
    }
}
