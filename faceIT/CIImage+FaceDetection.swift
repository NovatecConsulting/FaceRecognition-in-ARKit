//
//  CIImage+FaceDetection.swift
//  faceIT
//
//  Created by Michael Ruhl on 31.07.17.
//  Copyright © 2017 NovaTec GmbH. All rights reserved.
//

import Foundation
import Vision
import ARKit

public extension CIImage {
    
    var rotate: CIImage {
        get {
            return self.oriented(UIDevice.current.orientation.cameraOrientation())
        }
    }

    /// Cropping the image containing the face.
    ///
    /// - Parameter toFace: the face to extract
    /// - Returns: the cropped image
    func cropImage(toFace face: VNFaceObservation) -> CIImage {
        let percentage: CGFloat = 0.6
        
        let width = face.boundingBox.width * CGFloat(extent.size.width)
        let height = face.boundingBox.height * CGFloat(extent.size.height)
        let x = face.boundingBox.origin.x * CGFloat(extent.size.width)
        let y = face.boundingBox.origin.y * CGFloat(extent.size.height)
        let rect = CGRect(x: x, y: y, width: width, height: height)
        
        let increasedRect = rect.insetBy(dx: width * -percentage, dy: height * -percentage)
        return self.cropping(to: increasedRect)
    }
}

private extension UIDeviceOrientation {
    func cameraOrientation() -> CGImagePropertyOrientation {
        switch self {
        case .landscapeLeft: return .up
        case .landscapeRight: return .down
        case .portraitUpsideDown: return .left
        default: return .right
        }
    }
}
