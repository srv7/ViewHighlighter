//
//  TouchHighlightView.swift
//  ViewHighlighter
//
//  Created by 刘波 on 2019/5/30.
//

import UIKit

public class TouchHighlightView: UIView {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hl.isHighlighted = true
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        hl.isHighlighted = false
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        hl.isHighlighted = false
    }

}
