//
//  CenterCalculation.swift
//  Rectangle, Ported from Spectacle
//
//  Created by Ryan Hanson on 6/14/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Foundation

class CenterCalculation: WindowCalculation {
    
    override func calculateRect(_ params: RectCalculationParameters) -> RectResult {

        let visibleFrameOfScreen = params.visibleFrameOfScreen

        if rectFitsWithinRect(rect1: params.window.rect, rect2: visibleFrameOfScreen) {
            var calculatedWindowRect = params.window.rect
            calculatedWindowRect.origin.x = round((visibleFrameOfScreen.width - params.window.rect.width) / 2.0) + visibleFrameOfScreen.minX
            calculatedWindowRect.origin.y = round((visibleFrameOfScreen.height - params.window.rect.height) / 2.0) + visibleFrameOfScreen.minY
            return RectResult(calculatedWindowRect)
        } else {
            return RectResult(visibleFrameOfScreen)
        }

    }
    
}
