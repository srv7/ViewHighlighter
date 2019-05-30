//
//  UIViewExtension.swift
//  ViewHighlighter
//
//  Created by 刘波 on 2019/5/29.
//

import UIKit

extension UIView {
    
    func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layoutIfNeeded()
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

struct AssociatedKeys {
    
    static var highlighterKey = "UIView.ViewHighlighter"
}

public extension Highlight where Base: UIView {
    
    private var highlighter: ViewHighlighter {
        var object = objc_getAssociatedObject(base, &AssociatedKeys.highlighterKey) as? ViewHighlighter
        if object == nil {
            object = ViewHighlighter(view: base)
            objc_setAssociatedObject(base, &AssociatedKeys.highlighterKey, object!, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return object!
    }
    
    var highlightStyle: HighlightStyle {
        get { return highlighter.style }
        set { highlighter.style = newValue }
    }
    var isHighlighted: Bool {
        get { return highlighter.isHighlighted }
        set { highlighter.isHighlighted = newValue }
    }
}


