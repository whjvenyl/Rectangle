//
//  NextPrevDisplayCalculation.swift
//  Rectangle
//
//  Created by Ryan Hanson on 8/19/19.
//  Copyright © 2019 Ryan Hanson. All rights reserved.
//

import Cocoa

class NextPrevDisplayCalculation: WindowCalculation {
    
    let centerCalculation = CenterCalculation()
    
    override  func calculate(_ params: WindowCalculationParameters) -> WindowCalculationResult? {
        let usableScreens = params.usableScreens
        
        guard usableScreens.numScreens > 1 else { return nil }

        var screen: NSScreen?
        
        if params.action == .nextDisplay {
            screen = usableScreens.adjacentScreens?.next
        } else if params.action == .previousDisplay {
            screen = usableScreens.adjacentScreens?.prev
        }

        if let screen = screen {
            let rectParams = params.asRectParams(visibleFrame: screen.adjustedVisibleFrame)
            let rectResult = calculateRect(rectParams)
            return WindowCalculationResult(rect: rectResult.rect, screen: screen, resultingAction: params.action)
        }
        
        return nil
    }
    
    override func calculateRect(_ params: RectCalculationParameters) -> RectResult {
        
        return centerCalculation.calculateRect(params)
    }
}
