//
//  CTView.swift
//  CoreTextMagazine
//
//  Created by AhartIII on 2018/05/29.
//  Copyright © 2018 AhartIII. All rights reserved.
//

import UIKit
import CoreText

class CTView: UIView {

    // MARK: - Properties
    var attrString : NSAttributedString!

    // MARK: - Internal
    func importAttrString(_ attrString: NSAttributedString) {
        self.attrString = attrString
    }

   //1
    override func draw(_ rect: CGRect) {
        //2 unwrap current graphic context
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // flip the coordinate system
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)

        //3 create a path that bounds the drawing area which is the entire view
        let path = CGMutablePath()
        path.addRect(bounds)
        
        //4
//        let attrString = NSAttributedString(string: "Hello World")
        //5
        let framesetter = CTFramesetterCreateWithAttributedString(attrString as! CFMutableAttributedString)
        //6
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, nil)
        //7
        CTFrameDraw(frame, context)
    }

}
