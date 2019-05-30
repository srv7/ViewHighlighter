//
//  HighlightStyle.swift
//  ViewHighlighter
//
//  Created by 刘波 on 2019/5/29.
//

import UIKit

public enum HighlightStyle {
    
    case none
    case transparentMask(opacity: Float?)
    case lightBackground(color: UIColor?)
    case solidDarkOverlay(color: UIColor?, opacity: Float?)
    case hollowDarkOverlay(color: UIColor?, opacity: Float?)
}
