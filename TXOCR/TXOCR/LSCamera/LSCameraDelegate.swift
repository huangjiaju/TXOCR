//
//  LSCameraDelegate.swift
//  TXOCR
//
//  Created by lhs7248 on 2018/3/1.
//  Copyright © 2018年 lhs7248. All rights reserved.
//

import Foundation
import UIKit

// MARK: Public Protocol Declaration

/// Delegate for SwiftyCamViewController

public protocol LSCameraDelegate: class {
    
    /**
     SwiftyCamViewControllerDelegate function called when the takePhoto() function is called.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter photo: UIImage captured from the current session
     */
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didTake photo: UIImage)
    
    /**
     SwiftyCamViewControllerDelegate function called when SwiftyCamViewController begins recording video.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter camera: Current camera orientation
     */
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didBeginRecordingVideo camera: LSCameraViewController.CameraSelection)
    
    /**
     SwiftyCamViewControllerDelegate function called when SwiftyCamViewController finishes recording video.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter camera: Current camera orientation
     */
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFinishRecordingVideo camera: LSCameraViewController.CameraSelection)
    
    /**
     SwiftyCamViewControllerDelegate function called when SwiftyCamViewController is done processing video.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter url: URL location of video in temporary directory
     */
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFinishProcessVideoAt url: URL)
    
    
    /**
     SwiftyCamViewControllerDelegate function called when SwiftyCamViewController fails to record a video.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter error: An error object that describes the problem
     */
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFailToRecordVideo error: Error)
    
    /**
     SwiftyCamViewControllerDelegate function called when SwiftyCamViewController switches between front or rear camera.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter camera: Current camera selection
     */
    
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didSwitchCameras camera: LSCameraViewController.CameraSelection)
    
    /**
     SwiftyCamViewControllerDelegate function called when SwiftyCamViewController view is tapped and begins focusing at that point.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter point: Location in view where camera focused
     
     */
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFocusAtPoint point: CGPoint)
    
    /**
     SwiftyCamViewControllerDelegate function called when when SwiftyCamViewController view changes zoom level.
     
     - Parameter swiftyCam: Current SwiftyCamViewController session
     - Parameter zoom: Current zoom level
     */
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didChangeZoomLevel zoom: CGFloat)
}

public extension LSCameraDelegate {
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didTake photo: UIImage) {
        // Optional
    }
    
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didBeginRecordingVideo camera: LSCameraViewController.CameraSelection) {
        // Optional
    }
    
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFinishRecordingVideo camera: LSCameraViewController.CameraSelection) {
        // Optional
    }
    
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFinishProcessVideoAt url: URL) {
        // Optional
    }
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFailToRecordVideo error: Error) {
        // Optional
    }
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didSwitchCameras camera: LSCameraViewController.CameraSelection) {
        // Optional
    }
    
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didFocusAtPoint point: CGPoint) {
        // Optional
    }
    
    
    func swiftyCam(_ swiftyCam: LSCameraViewController, didChangeZoomLevel zoom: CGFloat) {
        // Optional
    }
}



