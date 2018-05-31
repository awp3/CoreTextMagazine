//
//  CTSettings.swift
//  CoreTextMagazine
//
//  Created by AhartIII on 2018/05/31.
//  Copyright © 2018 AhartIII. All rights reserved.
//

import Foundation
import UIKit

class CTSettings {
    // 1
    // MARK: - Properties
    let margins : CGFloat = 20
    var columnsPerPage : CGFloat!
    var pageRect : CGRect!
    var columnRect : CGRect!

    // MARK: - Initializers
    init() {
        // 2
        columnsPerPage = UIDevice.current.userInterfaceIdiom == .phone ? 1 : 2
        // 3
        pageRect = UIScreen.main.bounds.insetBy(dx: margins, dy: margins)
        // 4
        columnRect = CGRect(x: 0,
                            y: 0,
                            width: pageRect.width / columnsPerPage,
                            height: pageRect.height).insetBy(dx: margins, dy: margins)
    }
}
