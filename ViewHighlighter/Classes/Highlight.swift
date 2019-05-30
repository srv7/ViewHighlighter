//
//  Highlight.swift
//  ViewHighlighter
//
//  Created by 刘波 on 2019/5/29.
//

import class UIKit.UIView

public class Highlight<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol HighlightCompatible {
    
    associatedtype Compatible
    
    var hl: Highlight<Compatible> { get set }
}

public extension HighlightCompatible {
    
    var hl: Highlight<Self> {
        get {
            return Highlight(self)
        }
        set {
        }
    }
}

extension UIView: HighlightCompatible { }
